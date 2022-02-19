import Foundation
import lib_mach_platform_converter
import ArgumentParser
//
//let binaryPath = CommandLine.arguments[1]
//let minos = (CommandLine.arguments.count > 2 ? UInt32(CommandLine.arguments[2]) : nil) ?? 12
//let sdk = (CommandLine.arguments.count > 3 ? UInt32(CommandLine.arguments[3]) : nil) ?? 13
//let isDynamic = (CommandLine.arguments.count > 4 ? Bool(CommandLine.arguments[4]) : nil) ?? false
//if isDynamic {
//    print("[mach-platform-converter] notice: running in dynamic framework mode")
//}
//@main
struct Default: ParsableCommand {
    
    @Flag(name: .customLong("platforms", withSingleDash: true))
    var showPlatforms: Bool = false
       
    @Option(name: .customLong("input", withSingleDash: false), help: "Input mach-o file to parse")
    var binaryPath: String?
    
    @Option(name: .customLong("platform", withSingleDash: false), help: "The platform to set the binary to")
    var platform: Int32?
    
    @Option(name: .customLong("minos", withSingleDash: false), help: "The minos to set the binary to")
    var minos: UInt32?
    
    @Option(name: .customLong("sdk", withSingleDash: false), help: "The sdk to set the binary to")
    var sdk: UInt32?
    
    @Option(name: .customLong("dynamic", withSingleDash: false), help: "dynamic")
    var dynamic: Bool?
    
    func run() {
        if showPlatforms {
            for platform in Platform.allCases {
                print("\(platform.rawValue): \(String(describing: platform))")
            }
        } else {
            guard let path = binaryPath else { fatalError() }
            
            var selectedPlatform: Platform = Platform.MACCATALYST
            if let passedPlatform = self.platform {
                selectedPlatform = Platform.init(rawValue: passedPlatform)!
            }
            
            Transmogrifier.processBinary(atPath: path, minos: minos ?? 12, sdk: sdk ?? 13, platform: selectedPlatform, isDynamic: dynamic ?? false)
        }
    }
}


@main
enum Main {
    static func main() {
        let args = Array(CommandLine.arguments.dropFirst())
        do {
            let command = try Default.parse(args)
            command.run()
        } catch {
            print("❌ error: \(error)")
            Default.exit(withError: error)
        }
    }
}
