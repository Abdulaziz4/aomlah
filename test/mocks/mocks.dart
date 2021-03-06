import 'package:aomlah/core/models/bank_account.dart';
import 'package:aomlah/core/models/offer.dart';
import 'package:aomlah/core/models/trade.dart';
import 'package:aomlah/core/services/auth_service.dart';
import 'package:aomlah/core/services/supabase_service.dart';
import 'package:aomlah/core/services/trading_service.dart';
import 'package:aomlah/core/services/user_service.dart';
import 'package:mocktail/mocktail.dart';
import 'package:stacked_services/stacked_services.dart';

class MockUserService extends Mock implements UserService {}

class MockNavigationService extends Mock implements NavigationService {}

class MockSupabaseService extends Mock implements SupabaseService {}

class MockAuthService extends Mock implements AuthService {}

class MockSnackbarService extends Mock implements SnackbarService {}

class MockTradingService extends Mock implements TradingService {}

class FakeBankAccount extends Mock implements BankAccount {}

class FakeOffer extends Mock implements Offer {}

class FakeTrade extends Mock implements Trade {}
