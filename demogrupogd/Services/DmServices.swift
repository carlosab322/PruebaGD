//
//  DmServices.swift
//  demogrupogd
//
//  Created by DEV iOS on 10/24/20.
//
import Foundation
import Alamofire
class DmServices: MessageHelper {
    static let shared = DmServices(); private init() {
        //constructor por defecto
    }
    func userList(tipo: ServiceAction,
                     success: @escaping ([UserResponse]) -> Void,
                     fail: @escaping (_ result: String?) -> Void, finally : @escaping () -> Void) {
        let base = BaseRequest()
        DmServices.shared.callService(service: tipo, request: base,
                                    success: { (response: [UserResponse]) in
                                      
                                        success(response)
        }, fail: { (response) in fail("") }, finally: {
            //implementación para la finalización de la accion
        })
    }
    func reposList(tipo: ServiceAction,
                     success: @escaping ([ReposResponse]) -> Void,
                     fail: @escaping (_ result: String?) -> Void, finally : @escaping () -> Void) {
        let base = BaseRequest()
        DmServices.shared.callService(service: tipo, request: base,
                                    success: { (response: [ReposResponse]) in
                                        success(response)
        }, fail: { (response) in fail("") }, finally: {
            //implementación para la finalización de la accion
        })
    }
    func user(tipo: String,
                     success: @escaping (UserResponse) -> Void,
                     fail: @escaping (_ result: String?) -> Void, finally : @escaping () -> Void) {
        let base = BaseRequest()
        DmServices.shared.callServiceUni(service: tipo, request: base,
                                    success: { (response: UserResponse) in
                                        success(response)
        }, fail: { (response) in fail("") }, finally: {
            //implementación para la finalización de la accion
        })
    }
    /// permite ejecutar peticiones a la capa de servicio
    ///
    /// - Parameters:
    ///   - service: servicio a ejecutar
    ///   - request: modelo de tipo BaseRequest
    ///   - success: acción a ejecutar en caso de exito
    ///   - fail: acción a ejecutar en caso de falla
    ///   - finally: acción que se ejecutara al finalizar el llamado al servicio
    func callService<T: BaseResponse, E: Encodable>(service: ServiceAction,
                                                    request: E, success: @escaping ([T]) -> Void,
                                                    fail: @escaping (_ result: BaseResponse) -> Void,
                                                    finally : @escaping () -> Void) {
        let urlSave = Constants.baseUrl
        let urlRaw = urlSave + service.action
            let url = URL(string: urlRaw)
            guard let mUrl = url else { return }
            var urlRequest = URLRequest(url: mUrl)
            urlRequest.httpMethod = "GET"
            urlRequest.timeoutInterval = Constants.timeOut
        let request = AF.request(urlRequest)
            request.responseJSON { (info) in
                if  let e = info.data {
                    do{
                    print("Respuesta \(String(data: e, encoding: .utf8) ?? "")")
                        let decoder = JSONDecoder()
                        switch info.result {
                        case .success:
                            let responseObject = try decoder.decode([T].self, from: e)
                            success(responseObject)
                            break
                        case .failure(let error):
                            let errorResponseBase = self.procesarError(error: error)
                            fail(errorResponseBase)
                            break
                        }
                    }
                    catch {
                        print("Error info: \(error)")
                        let errorResponseBase = BaseResponse()
                        fail(errorResponseBase)
                    }
                    finally()
                    
                   
                }
            }
    }
    /// permite ejecutar peticiones a la capa de servicio en objeto
    ///
    /// - Parameters:
    ///   - service: servicio a ejecutar
    ///   - request: modelo de tipo BaseRequest
    ///   - success: acción a ejecutar en caso de exito
    ///   - fail: acción a ejecutar en caso de falla
    ///   - finally: acción que se ejecutara al finalizar el llamado al servicio
    func callServiceUni<T: BaseResponse, E: Encodable>(service: String,
                                                    request: E, success: @escaping (T) -> Void,
                                                    fail: @escaping (_ result: BaseResponse) -> Void,
                                                    finally : @escaping () -> Void) {
        let urlSave = Constants.baseUrl
        let urlRaw = urlSave + Constants.commandUrlSearch
            let url = URL(string: urlRaw)
            guard let mUrl = url else { return }
            var urlRequest = URLRequest(url: mUrl)
            urlRequest.httpMethod = "GET"
            urlRequest.timeoutInterval = Constants.timeOut
        let request = AF.request(urlRequest)
            request.responseJSON { (info) in
                if  let e = info.data {
                    do{
                    print("Respuesta \(String(data: e, encoding: .utf8) ?? "")")
                        let decoder = JSONDecoder()
                        switch info.result {
                        case .success:
                            let responseObject = try decoder.decode(T.self, from: e)
                            success(responseObject)
                            break
                        case .failure(let error):
                            let errorResponseBase = self.procesarError(error: error)
                            fail(errorResponseBase)
                            break
                        }
                    }
                    catch {
                        print("Error info: \(error)")
                        let errorResponseBase = BaseResponse()
                        fail(errorResponseBase)
                    }
                    finally()
                    
                   
                }
            }
    }
}
extension DmServices {
    /// función que valida si el error es de red
    ///
    /// - Parameter error: obtenido en la ejecución del servicio
    /// - Returns: respuesta base con las descripción del error
    func procesarError(error: Error) -> BaseResponse {
       let serror =  error as NSError
        var descripcion = Constants.errorGeneral
        let errorValue = ErrorConnection.init(rawValue: serror.code)
        switch errorValue {
        case .some(.notConnectedToInternet), .some(.connectionLost) :
              descripcion = Constants.errorGeneral
        default:
            break
        }
        return BaseResponse()
    }
    
}
