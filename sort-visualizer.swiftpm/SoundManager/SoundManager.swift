import AVKit

public class SoundManager {
    
    public static let instance = SoundManager()
    public var player: AVAudioPlayer?
    public enum SoundOption: String {
        case button
        case start
        case bell
    }
    
    public func playSound(sound: SoundOption) {
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("Error playing sound: \(error.localizedDescription)")
        }
    }
}
