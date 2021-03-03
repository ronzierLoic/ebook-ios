//
//  Resolver+Extension.swift
//  ebook-ios
//
//  Created by Loic RONZIER on 03/03/2021.
//  Copyright © 2020 Loic RONZIER. All rights reserved.
//

import Swinject

public extension Resolver {
    /// Retrieves the instance with the specified service type.
    /// Crashes with useful message if the service can't be found.
    ///
    /// - Parameter serviceType: The service type to resolve.
    ///
    /// - Returns: The resolved service type instance.
    func forceResolve<Service>(_ serviceType: Service.Type) -> Service {
        guard let service = resolve(serviceType) else {
            fatalError("The service \(serviceType) can't be resolved")
        }
        return service
    }

    /// Retrieves the instance with the specified service type and registration name.
    /// Crashes with useful message if the service can't be found.
    ///
    /// - Parameters:
    ///   - serviceType: The service type to resolve.
    ///   - name:        The registration name.
    ///
    /// - Returns: The resolved service type instance.
    func forceResolve<Service>(_ serviceType: Service.Type, name: String?) -> Service {
        guard let service = resolve(serviceType, name: name) else {
            fatalError("The service \(serviceType) can't be resolved with name \(name ?? "nil")")
        }
        return service
    }

    /// Retrieves the instance with the specified service type and 1 argument to the factory closure.
    ///
    /// - Parameters:
    ///   - serviceType: The service type to resolve.
    ///   - argument:   1 argument to pass to the factory closure.
    ///
    /// - Returns: The resolved service type instance, or nil if no registration for the service type
    ///            and 1 argument is found.
    func forceResolve<Service, Arg1>(_ serviceType: Service.Type, argument: Arg1) -> Service {
        guard let service = resolve(serviceType, argument: argument) else {
            fatalError("The service \(serviceType) can't be resolved with argument \(argument)")
        }
        return service
    }

    /// Retrieves the instance with the specified service type, 1 argument to the factory closure and registration name.
    ///
    /// - Parameters:
    ///   - serviceType: The service type to resolve.
    ///   - name:        The registration name.
    ///   - argument:   1 argument to pass to the factory closure.
    ///
    /// - Returns: The resolved service type instance, or nil if no registration for the service type,
    ///            1 argument and name is found.
    func forceResolve<Service, Arg1>(_ serviceType: Service.Type, name: String?, argument: Arg1) -> Service {
        guard let service = resolve(serviceType, name: name, argument: argument) else {
            fatalError("The service \(serviceType) can't be resolved with name \(name ?? "nil") and argument \(argument)")
        }
        return service
    }

    /// Retrieves the instance with the specified service type and list of 2 arguments to the factory closure.
    ///
    /// - Parameters:
    ///   - serviceType: The service type to resolve.
    ///   - arguments:   List of 2 arguments to pass to the factory closure.
    ///
    /// - Returns: The resolved service type instance, or nil if no registration for the service type
    ///            and list of 2 arguments is found.
    func forceResolve<Service, Arg1, Arg2>(_ serviceType: Service.Type, arguments arg1: Arg1, _ arg2: Arg2) -> Service {
        guard let service = resolve(serviceType, arguments: arg1, arg2) else {
            fatalError("The service \(serviceType) can't be resolved with arguments \(arg1), \(arg2)")
        }
        return service
    }

    /// Retrieves the instance with the specified service type, list of 2 arguments to the factory closure and registration name.
    ///
    /// - Parameters:
    ///   - serviceType: The service type to resolve.
    ///   - name:        The registration name.
    ///   - arguments:   List of 2 arguments to pass to the factory closure.
    ///
    /// - Returns: The resolved service type instance, or nil if no registration for the service type,
    ///            list of 2 arguments and name is found.
    func forceResolve<Service, Arg1, Arg2>(_ serviceType: Service.Type, name: String?, arguments arg1: Arg1, _ arg2: Arg2) -> Service {
        guard let service = resolve(serviceType, name: name, arguments: arg1, arg2) else {
            fatalError("The service \(serviceType) can't be resolved with name \(name ?? "nil") and arguments \(arg1), \(arg2)")
        }
        return service
    }

    /// Retrieves the instance with the specified service type and list of 3 arguments to the factory closure.
    ///
    /// - Parameters:
    ///   - serviceType: The service type to resolve.
    ///   - arguments:   List of 3 arguments to pass to the factory closure.
    ///
    /// - Returns: The resolved service type instance, or nil if no registration for the service type
    ///            and list of 3 arguments is found.
    func forceResolve<Service, Arg1, Arg2, Arg3>(_ serviceType: Service.Type, arguments arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3) -> Service {
        guard let service = resolve(serviceType, arguments: arg1, arg2, arg3) else {
            fatalError("The service \(serviceType) can't be resolved with arguments \(arg1), \(arg2), \(arg3)")
        }
        return service
    }

    /// Retrieves the instance with the specified service type, list of 3 arguments to the factory closure and registration name.
    ///
    /// - Parameters:
    ///   - serviceType: The service type to resolve.
    ///   - name:        The registration name.
    ///   - arguments:   List of 3 arguments to pass to the factory closure.
    ///
    /// - Returns: The resolved service type instance, or nil if no registration for the service type,
    ///            list of 3 arguments and name is found.
    func forceResolve<Service, Arg1, Arg2, Arg3>(_ serviceType: Service.Type, name: String?, arguments arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3) -> Service {
        guard let service = resolve(serviceType, name: name, arguments: arg1, arg2, arg3) else {
            fatalError("The service \(serviceType) can't be resolved with name \(name ?? "nil") arguments \(arg1), \(arg2), \(arg3)")
        }
        return service
    }

    /// Retrieves the instance with the specified service type and list of 4 arguments to the factory closure.
    ///
    /// - Parameters:
    ///   - serviceType: The service type to resolve.
    ///   - arguments:   List of 4 arguments to pass to the factory closure.
    ///
    /// - Returns: The resolved service type instance, or nil if no registration for the service type
    ///            and list of 4 arguments is found.
    func forceResolve<Service, Arg1, Arg2, Arg3, Arg4>(_ serviceType: Service.Type, arguments arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3, _ arg4: Arg4) -> Service {
        guard let service = resolve(serviceType, arguments: arg1, arg2, arg3, arg4) else {
            fatalError("The service \(serviceType) can't be resolved with arguments \(arg1), \(arg2), \(arg3), \(arg4)")
        }
        return service
    }

    /// Retrieves the instance with the specified service type, list of 4 arguments to the factory closure and registration name.
    ///
    /// - Parameters:
    ///   - serviceType: The service type to resolve.
    ///   - name:        The registration name.
    ///   - arguments:   List of 4 arguments to pass to the factory closure.
    ///
    /// - Returns: The resolved service type instance, or nil if no registration for the service type,
    ///            list of 4 arguments and name is found.
    func forceResolve<Service, Arg1, Arg2, Arg3, Arg4>(_ serviceType: Service.Type, name: String?, arguments arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3, _ arg4: Arg4) -> Service {
        guard let service = resolve(serviceType, name: name, arguments: arg1, arg2, arg3, arg4) else {
            fatalError("The service \(serviceType) can't be resolved with name \(name ?? "nil") and arguments \(arg1), \(arg2), \(arg3), \(arg4)")
        }
        return service
    }

    /// Retrieves the instance with the specified service type and list of 5 arguments to the factory closure.
    ///
    /// - Parameters:
    ///   - serviceType: The service type to resolve.
    ///   - arguments:   List of 5 arguments to pass to the factory closure.
    ///
    /// - Returns: The resolved service type instance, or nil if no registration for the service type
    ///            and list of 5 arguments is found.
    func forceResolve<Service, Arg1, Arg2, Arg3, Arg4, Arg5>(_ serviceType: Service.Type, arguments arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3, _ arg4: Arg4, _ arg5: Arg5) -> Service {
        guard let service = resolve(serviceType, arguments: arg1, arg2, arg3, arg4, arg5) else {
            fatalError("The service \(serviceType) can't be resolved with arguments \(arg1), \(arg2), \(arg3), \(arg4), \(arg5)")
        }
        return service
    }

    /// Retrieves the instance with the specified service type, list of 5 arguments to the factory closure and registration name.
    ///
    /// - Parameters:
    ///   - serviceType: The service type to resolve.
    ///   - name:        The registration name.
    ///   - arguments:   List of 5 arguments to pass to the factory closure.
    ///
    /// - Returns: The resolved service type instance, or nil if no registration for the service type,
    ///            list of 5 arguments and name is found.
    func forceResolve<Service, Arg1, Arg2, Arg3, Arg4, Arg5>(_ serviceType: Service.Type, name: String?, arguments arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3, _ arg4: Arg4, _ arg5: Arg5) -> Service {
        guard let service = resolve(serviceType, name: name, arguments: arg1, arg2, arg3, arg4, arg5) else {
            fatalError("The service \(serviceType) can't be resolved with name \(name ?? "nil") and arguments \(arg1), \(arg2), \(arg3), \(arg4), \(arg5)")
        }
        return service
    }

    /// Retrieves the instance with the specified service type and list of 6 arguments to the factory closure.
    ///
    /// - Parameters:
    ///   - serviceType: The service type to resolve.
    ///   - arguments:   List of 6 arguments to pass to the factory closure.
    ///
    /// - Returns: The resolved service type instance, or nil if no registration for the service type
    ///            and list of 6 arguments is found.
    func forceResolve<Service, Arg1, Arg2, Arg3, Arg4, Arg5, Arg6>(_ serviceType: Service.Type, arguments arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3, _ arg4: Arg4, _ arg5: Arg5, _ arg6: Arg6) -> Service {
        guard let service = resolve(serviceType, arguments: arg1, arg2, arg3, arg4, arg5, arg6) else {
            fatalError("The service \(serviceType) can't be resolved with arguments \(arg1), \(arg2), \(arg3), \(arg4), \(arg5), \(arg6)")
        }
        return service
    }

    /// Retrieves the instance with the specified service type, list of 6 arguments to the factory closure and registration name.
    ///
    /// - Parameters:
    ///   - serviceType: The service type to resolve.
    ///   - name:        The registration name.
    ///   - arguments:   List of 6 arguments to pass to the factory closure.
    ///
    /// - Returns: The resolved service type instance, or nil if no registration for the service type,
    ///            list of 6 arguments and name is found.
    func forceResolve<Service, Arg1, Arg2, Arg3, Arg4, Arg5, Arg6>(_ serviceType: Service.Type, name: String?, arguments arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3, _ arg4: Arg4, _ arg5: Arg5, _ arg6: Arg6) -> Service {
        guard let service = resolve(serviceType, name: name, arguments: arg1, arg2, arg3, arg4, arg5, arg6) else {
            fatalError("The service \(serviceType) can't be resolved with name \(name ?? "nil") and arguments \(arg1), \(arg2), \(arg3), \(arg4), \(arg5), \(arg6)")
        }
        return service
    }

    /// Retrieves the instance with the specified service type and list of 7 arguments to the factory closure.
    ///
    /// - Parameters:
    ///   - serviceType: The service type to resolve.
    ///   - arguments:   List of 7 arguments to pass to the factory closure.
    ///
    /// - Returns: The resolved service type instance, or nil if no registration for the service type
    ///            and list of 7 arguments is found.
    func forceResolve<Service, Arg1, Arg2, Arg3, Arg4, Arg5, Arg6, Arg7>(_ serviceType: Service.Type, arguments arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3, _ arg4: Arg4, _ arg5: Arg5, _ arg6: Arg6, _ arg7: Arg7) -> Service {
        guard let service = resolve(serviceType, arguments: arg1, arg2, arg3, arg4, arg5, arg6, arg7) else {
            fatalError("The service \(serviceType) can't be resolved with arguments \(arg1), \(arg2), \(arg3), \(arg4), \(arg5), \(arg6), \(arg7)")
        }
        return service
    }

    /// Retrieves the instance with the specified service type, list of 7 arguments to the factory closure and registration name.
    ///
    /// - Parameters:
    ///   - serviceType: The service type to resolve.
    ///   - name:        The registration name.
    ///   - arguments:   List of 7 arguments to pass to the factory closure.
    ///
    /// - Returns: The resolved service type instance, or nil if no registration for the service type,
    ///            list of 7 arguments and name is found.
    func forceResolve<Service, Arg1, Arg2, Arg3, Arg4, Arg5, Arg6, Arg7>(_ serviceType: Service.Type, name: String?, arguments arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3, _ arg4: Arg4, _ arg5: Arg5, _ arg6: Arg6, _ arg7: Arg7) -> Service {
        guard let service = resolve(serviceType, name: name, arguments: arg1, arg2, arg3, arg4, arg5, arg6, arg7) else {
            fatalError("The service \(serviceType) can't be resolved with name \(name ?? "nil"), arguments \(arg1), \(arg2), \(arg3), \(arg4), \(arg5), \(arg6), \(arg7)")
        }
        return service
    }

    /// Retrieves the instance with the specified service type and list of 8 arguments to the factory closure.
    ///
    /// - Parameters:
    ///   - serviceType: The service type to resolve.
    ///   - arguments:   List of 8 arguments to pass to the factory closure.
    ///
    /// - Returns: The resolved service type instance, or nil if no registration for the service type
    ///            and list of 8 arguments is found.
    func forceResolve<Service, Arg1, Arg2, Arg3, Arg4, Arg5, Arg6, Arg7, Arg8>(_ serviceType: Service.Type, arguments arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3, _ arg4: Arg4, _ arg5: Arg5, _ arg6: Arg6, _ arg7: Arg7, _ arg8: Arg8) -> Service {
        guard let service = resolve(serviceType, arguments: arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8) else {
            fatalError("The service \(serviceType) can't be resolved with arguments \(arg1), \(arg2), \(arg3), \(arg4), \(arg5), \(arg6), \(arg7), \(arg8)")
        }
        return service
    }

    /// Retrieves the instance with the specified service type, list of 8 arguments to the factory closure and registration name.
    ///
    /// - Parameters:
    ///   - serviceType: The service type to resolve.
    ///   - name:        The registration name.
    ///   - arguments:   List of 8 arguments to pass to the factory closure.
    ///
    /// - Returns: The resolved service type instance, or nil if no registration for the service type,
    ///            list of 8 arguments and name is found.
    func forceResolve<Service, Arg1, Arg2, Arg3, Arg4, Arg5, Arg6, Arg7, Arg8>(_ serviceType: Service.Type, name: String?, arguments arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3, _ arg4: Arg4, _ arg5: Arg5, _ arg6: Arg6, _ arg7: Arg7, _ arg8: Arg8) -> Service {
        guard let service = resolve(serviceType, name: name, arguments: arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8) else {
            fatalError("The service \(serviceType) can't be resolved with name: \(name ?? "nil"), arguments \(arg1), \(arg2), \(arg3), \(arg4), \(arg5), \(arg6), \(arg7), \(arg8)")
        }
        return service
    }

    /// Retrieves the instance with the specified service type and list of 9 arguments to the factory closure.
    ///
    /// - Parameters:
    ///   - serviceType: The service type to resolve.
    ///   - arguments:   List of 9 arguments to pass to the factory closure.
    ///
    /// - Returns: The resolved service type instance, or nil if no registration for the service type
    ///            and list of 9 arguments is found.
    func forceResolve<Service, Arg1, Arg2, Arg3, Arg4, Arg5, Arg6, Arg7, Arg8, Arg9>(_ serviceType: Service.Type, arguments arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3, _ arg4: Arg4, _ arg5: Arg5, _ arg6: Arg6, _ arg7: Arg7, _ arg8: Arg8, _ arg9: Arg9) -> Service {
        guard let service = resolve(serviceType, arguments: arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9) else {
            fatalError("The service \(serviceType) can't be resolved with arguments \(arg1), \(arg2), \(arg3), \(arg4), \(arg5), \(arg6), \(arg7), \(arg8), \(arg9)")
        }
        return service
    }

    /// Retrieves the instance with the specified service type, list of 9 arguments to the factory closure and registration name.
    ///
    /// - Parameters:
    ///   - serviceType: The service type to resolve.
    ///   - name:        The registration name.
    ///   - arguments:   List of 9 arguments to pass to the factory closure.
    ///
    /// - Returns: The resolved service type instance, or nil if no registration for the service type,
    ///            list of 9 arguments and name is found.
    func forceResolve<Service, Arg1, Arg2, Arg3, Arg4, Arg5, Arg6, Arg7, Arg8, Arg9>(_ serviceType: Service.Type, name: String?, arguments arg1: Arg1, _ arg2: Arg2, _ arg3: Arg3, _ arg4: Arg4, _ arg5: Arg5, _ arg6: Arg6, _ arg7: Arg7, _ arg8: Arg8, _ arg9: Arg9) -> Service {
        guard let service = resolve(serviceType, name: name, arguments: arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9) else {
            fatalError("The service \(serviceType) can't be resolved with name \(name ?? "nil") arguments \(arg1), \(arg2), \(arg3), \(arg4), \(arg5), \(arg6), \(arg7), \(arg8), \(arg9)")
        }
        return service
    }
}
