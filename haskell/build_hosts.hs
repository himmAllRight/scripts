-- Imports
import System.Environment

main = do
  hostname:args     <- getArgs
  ipContents <- readFile "host_names.txt"
  writeFile "host_output"  hostsHeader
  appendFile "host_output" (localHostContent hostname)
  appendFile "host_output" ipContents
  putStrLn (completeMessage hostname)

--outputFile :: [String] -> IO ()
--outputFile args = if null args then "hosts_output" else head args

hostsHeader :: String
hostsHeader = "#\n# /etc/hosts: static lookup table for host names\n#\n\n"

localHostContent :: String -> String
localHostContent hostname = "#<ip-address>\t<hostname.domain.org>\t<hostname>\n127.0.0.1\tlocalhost.localdomain\t" ++ hostname ++"\n::1\t\tlocalhost.localdomain\t" ++ hostname ++ "\n\n"

completeMessage :: String -> String
completeMessage hostname = "New hosts file generated for " ++ hostname ++ " and saved to host_output."
