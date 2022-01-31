import Foundation
import CombineMoya
import Combine
import Moya

public class KcsChannelProvider {

    private let provider: MoyaProvider<KcsChannelService> = MoyaProvider()

    public init() {}

    public func request(_ targetType: KcsChannelService) -> AnyPublisher<Data, Error> {
        provider
            .requestPublisher(targetType, callbackQueue: .global())
            .map { $0.data }
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
}
