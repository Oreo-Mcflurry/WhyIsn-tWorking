//
//  PostRequestModel.swift
//  DevCommunity
//
//  Created by A_Mcflurry on 5/3/24.
//

import Foundation
import Moya
import RxSwift

final class PostRequestManager: BaseRequestManager {

	private var provider: MoyaProvider<PostRouter>

	override init() {
		let container = DIContainer.shared
		self.provider = MoyaProvider<PostRouter>(session: Session(interceptor: container.interceptor), plugins: [container.moyaLogger, container.moyaCacheablePlugin])
	}

	func getEventPosts() -> Single<Result<EventPostsResultModel, Error>> {
		let query = PostsRequestModel(next: "", product_id: "DevCommunity")
		return Single<Result<EventPostsResultModel, Error>>.create { single in
			self.provider.request(.getPost(query: query)) { response in
				self.requestHandling(single, response: response)
			}
			return Disposables.create()
		}
	}

	func getPartyPosts(query: PostsRequestModel) -> Single<Result<PartyPostsResultModel, Error>> {
		return Single<Result<PartyPostsResultModel, Error>>.create { single in
			self.provider.request(.getPartyPost(query: query)) { response in
				self.requestHandling(single, response: response)
			}
			return Disposables.create()
		}
	}

	func likePost(postID: String, query: LikeRequestModel) -> Single<Result<LikeResultModel, Error>> {
		return Single<Result<LikeResultModel, Error>>.create { single in
			self.provider.request(.like(postID: postID, query: query)) { response in
				self.requestHandling(single, response: response)
			}
			return Disposables.create()
		}
	}

	func writePost(data: WritePostRequestModel) -> Single<Result<PartyPost, Error>> {
		return Single<Result<PartyPost, Error>>.create { single in
			self.provider.request(.writePost(data: data)) { response in
				self.requestHandling(single, response: response)
			}
			return Disposables.create()
		}
	}

	func writeJoinPost(postID: String, data: JoinRequestModel) -> Single<Result<WriteJoinResultModel, Error>> {
		return Single<Result<WriteJoinResultModel, Error>>.create { single in
			self.provider.request(.writeJoin(postID: postID, data: data)) { response in
				self.requestHandling(single, response: response)
			}
			return Disposables.create()
		}
	}

	func getOnePost(postID: String) -> Single<Result<PartyPost, Error>> {
		return Single<Result<PartyPost, Error>>.create { single in
			self.provider.request(.getOnePartyPost(postID: postID)) { response in
				self.requestHandling(single, response: response)
			}
			return Disposables.create()
		}
	}

	func getEventOnePost(postID: String) -> Single<Result<EventPost, Error>> {
		return Single<Result<EventPost, Error>>.create { single in
			self.provider.request(.getOnePartyPost(postID: postID)) { response in
				self.requestHandling(single, response: response)
			}
			return Disposables.create()
		}
	}
}

extension PostRequestManager: MoyaCacheable {
	var cachePolicy: MoyaCacheablePolicy {
		return .reloadIgnoringLocalCacheData
	}
}
