import Foundation
import UIKit

final class PlaybackPresenter {
    
    static func startPlayback(
        from viewController: UIViewController,
        track: AudioTrack
    ) {
        /*
         En lugar de presentar este controlador de vista diractamente,
         lo que vamos a hacer es vamos a presentar este controlador de
         vista envuelto en un controlador de navegacion
         */
        let vc = PlayerViewController()
        // viewController.present(vc, animated: true, completion: nil)
        vc.title = track.name
        viewController.present(UINavigationController(rootViewController: vc), animated: true, completion: nil)
    }
    
    static func startPlayback(
        from viewController: UIViewController,
        tracks: [AudioTrack]
    ) {
        let vc = PlayerViewController()
        // viewController.present(vc, animated: true, completion: nil)
        viewController.present(UINavigationController(rootViewController: vc), animated: true, completion: nil)
    }
}
