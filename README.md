# Clean Architecture SwiftUI News App

A SwiftUI application demonstrating **Clean Architecture** principles with a modular, testable, and maintainable codebase.

## 🏗️ Architecture Overview

This project follows **Clean Architecture** implementing clear separation of concerns across multiple layers with proper dependency inversion.

```
┌─────────────────────────────────────────────────────────────┐
│                    PRESENTATION LAYER                       │
├─────────────────────────────────────────────────────────────┤
│                    COMPOSITION LAYER                        │
├─────────────────────────────────────────────────────────────┤
│                      DOMAIN LAYER                           │
├─────────────────────────────────────────────────────────────┤
│                       DATA LAYER                            │
└─────────────────────────────────────────────────────────────┘
```

### Layer Responsibilities

- **Presentation**: UI components, state management, user interactions
- **Composition**: Dependency injection, object creation, flow coordination
- **Domain**: Business logic, use cases, entities, interfaces (contracts)
- **Data**: External services, repositories, decorators, infrastructure

## 📁 Project Structure

```
Architecture/
├── Features/
│   └── NewsDetail/
│       ├── Presentation/
│       │   ├── Views/           # UI Components
│       │   ├── Flows/           # State Management
│       │   └── State/           # Observable State
│       ├── Composition/
│       │   ├── Composers/       # Dependency Injection
│       │   └── Actions/         # Business Actions
│       ├── Domain/
│       │   ├── Entities/        # Domain Models
│       │   ├── Interfaces/      # Contracts
│       │   └── UseCases/        # Business Logic
│       └── Data/
│           ├── Services/        # External APIs
│           ├── Repositories/    # Data Access
│           └── Decorators/      # Cross-cutting Concerns
└── Shared/
    └── Common/                  # Shared Infrastructure
```

## 🎯 Key Design Patterns

### 1. **Clean Architecture**
- **Dependency Rule**: Dependencies point inward only
- **Layer Independence**: Each layer can be developed and tested independently
- **Framework Independence**: Business logic doesn't depend on UI frameworks

### 2. **Repository Pattern**
```swift
protocol ArticlesInterface {
    func getArticles() async throws -> [Article]
}

struct ArticleRepository: ArticlesInterface {
    // Data access implementation
}
```

### 3. **Decorator Pattern**
```swift
struct ArticleDecorator: ArticlesInterface {
    private let logger: LoggerInterface
    private let repository: ArticlesInterface
    
    // Adds logging without modifying original repository
}
```

### 4. **Composer Pattern (Dependency Injection)**
```swift
struct ArticleSectionComposer {
    static func compose(state: NewsState) -> ArticleFlow<ArticleCard> {
        // Creates and wires up dependencies
    }
}
```

### 5. **Observable State Management**
```swift
@Observable
class NewsState {
    var articles: [Article] = []
}
```

## 🔄 Data Flow

```
UI Interaction → Action → UseCase → Repository → External Service
      ↑                                              ↓
   State ←── State Update ←── Domain Model ←── Raw Data
```

1. **User Interaction**: UI component triggers action
2. **Action Execution**: Calls appropriate use case
3. **Business Logic**: Use case applies business rules
4. **Data Access**: Repository fetches data via service
5. **State Update**: Results update observable state
6. **UI Refresh**: SwiftUI automatically re-renders

## 🧩 Core Components

### Presentation Layer
- **NewsDetailView**: Entry point and main container
- **ArticleCard**: Displays individual articles
- **NewsDetailFlow**: Manages state lifecycle
- **NewsState**: Observable state container

### Domain Layer
- **Article**: Core business entity
- **ArticleUseCase**: Business logic for article operations
- **ArticlesInterface**: Contract for data access

### Data Layer
- **ArticleService**: External API integration
- **ArticleRepository**: Data access implementation
- **ArticleDecorator**: Cross-cutting concerns (logging)

### Composition Layer
- **NewsDetailComposer**: Main dependency injection
- **ArticleSectionComposer**: Section-specific composition
- **ArticleAction**: Coordinates between UI and domain

## ✅ Benefits of This Architecture

### 🧪 **Testability**
- Each layer can be unit tested independently
- Easy mocking with protocol-based dependencies
- Clear separation enables focused testing

### 🔄 **Maintainability**
- Changes in one layer don't affect others
- Feature-based organization
- Clear naming conventions

### 📈 **Scalability**
- Easy to add new features without touching existing code
- Modular structure supports team development
- Can extract features into separate packages

### 🔄 **Flexibility**
- Easy to swap implementations (Repository pattern)
- Add cross-cutting concerns via decorators
- Framework-independent business logic

### ♻️ **Reusability**
- Domain logic can be reused across different UI frameworks
- Shared infrastructure components
- Decorator pattern enables flexible feature composition

## 🚀 Getting Started

### Prerequisites
- Xcode 15.0+
- iOS 17.0+
- Swift 5.9+

### Running the App
1. Clone the repository
2. Open `Architecture.xcodeproj` in Xcode
3. Build and run the project

### Running Tests
```bash
# Unit tests
cmd + U in Xcode

# Or via command line
xcodebuild test -scheme Architecture
```

## 🧪 Testing Strategy

### Unit Tests
- **Domain Layer**: Test use cases and business logic
- **Data Layer**: Test repositories and services
- **Presentation Layer**: Test view models and state

### Integration Tests
- **Composition**: Test dependency wiring
- **Data Flow**: Test end-to-end scenarios

### UI Tests
- **User Interactions**: Test complete user workflows
- **State Updates**: Verify UI responds to state changes

## 📝 Code Examples

### Creating a New Feature
```swift
// 1. Define domain interface
protocol NewFeatureInterface {
    func performAction() async throws -> Result
}

// 2. Create use case
struct NewFeatureUseCase {
    let repository: NewFeatureInterface
}

// 3. Implement repository
struct NewFeatureRepository: NewFeatureInterface {
    // Implementation
}

// 4. Create composer
struct NewFeatureComposer {
    static func compose() -> NewFeatureView {
        // Wire dependencies
    }
}
```

### Adding Cross-cutting Concerns
```swift
struct CachingDecorator<T>: SomeInterface {
    private let wrapped: SomeInterface
    private var cache: Cache<T>
    
    // Add caching behavior
}
```

## 🔧 Configuration

### Environment Setup
- Development: Uses mock services
- Production: Uses real API endpoints
- Testing: Uses in-memory implementations

### Logging
- Console logging in development
- File logging in production
- Remote logging for analytics

## 📚 Learning Resources

- [Clean Architecture by Robert C. Martin](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
- [SwiftUI Documentation](https://developer.apple.com/documentation/swiftui)
- [Repository Pattern](https://martinfowler.com/eaaCatalog/repository.html)
- [Decorator Pattern](https://refactoring.guru/design-patterns/decorator)

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Follow the existing architecture patterns
4. Add tests for new functionality
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 🏆 Best Practices Demonstrated

- ✅ **Dependency Inversion Principle**
- ✅ **Single Responsibility Principle**
- ✅ **Open/Closed Principle**
- ✅ **Interface Segregation Principle**
- ✅ **Don't Repeat Yourself (DRY)**
- ✅ **You Aren't Gonna Need It (YAGNI)**
- ✅ **Keep It Simple, Stupid (KISS)**

---

*Built with ❤️ using Clean Architecture principles and SwiftUI*
