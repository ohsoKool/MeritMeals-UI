enum AppConfig {
    static var baseURL: String {
        #if PROD
        return "http://127.0.0.1:8080"
        #else
        return "https://handsomest-rylee-soaplike.ngrok-free.dev/"
        #endif
    }
}
