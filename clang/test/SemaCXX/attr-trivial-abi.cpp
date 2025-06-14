// RUN: %clang_cc1 -fsyntax-only -verify=expected,itanium %s -triple x86_64-unknown-linux -std=c++11
// RUN: %clang_cc1 -fsyntax-only -verify=expected,windows %s -triple x86_64-windows-msvc -std=c++11
// RUN: %clang_cc1 -fsyntax-only -verify=expected,scei %s -triple x86_64-scei-ps4 -std=c++11


void __attribute__((trivial_abi)) foo(); // expected-warning {{'trivial_abi' attribute only applies to classes}}

// Should not crash.
template <class>
class __attribute__((trivial_abi)) a { a(a &&); };
#if defined(_WIN64) && !defined(__MINGW32__)
// On Windows/MSVC, to be trivial-for-calls, an object must be trivially copyable.
// (And it is only trivially relocatable, currently, if it is trivial for calls.)
// In this case, it is suppressed by an explicitly defined move constructor.
// Similar concerns apply to later tests that have #if defined(_WIN64) && !defined(__MINGW32__)
static_assert(!__is_trivially_relocatable(a<int>), ""); // expected-warning{{deprecated}}
static_assert(!__builtin_is_cpp_trivially_relocatable(a<int>), "");
#else
static_assert(__is_trivially_relocatable(a<int>), ""); // expected-warning{{deprecated}}
static_assert(!__builtin_is_cpp_trivially_relocatable(a<int>), "");
#endif

struct [[clang::trivial_abi]] S0 {
  int a;
};
static_assert(__is_trivially_relocatable(S0), ""); // expected-warning{{deprecated}}
static_assert(__builtin_is_cpp_trivially_relocatable(S0), "");

struct __attribute__((trivial_abi)) S1 {
  int a;
};
static_assert(__is_trivially_relocatable(S1), ""); // expected-warning{{deprecated}}
static_assert(__builtin_is_cpp_trivially_relocatable(S1), "");


struct __attribute__((trivial_abi)) S3 { // expected-warning {{'trivial_abi' cannot be applied to 'S3'}} expected-note {{is polymorphic}}
  virtual void m();
};
static_assert(!__is_trivially_relocatable(S3), ""); // expected-warning{{deprecated}}
static_assert(__builtin_is_cpp_trivially_relocatable(S3), "");


struct S3_2 {
  virtual void m();
} __attribute__((trivial_abi)); // expected-warning {{'trivial_abi' cannot be applied to 'S3_2'}} expected-note {{is polymorphic}}
static_assert(!__is_trivially_relocatable(S3_2), ""); // expected-warning{{deprecated}}
static_assert(__builtin_is_cpp_trivially_relocatable(S3_2), "");

struct __attribute__((trivial_abi)) S3_3 { // expected-warning {{'trivial_abi' cannot be applied to 'S3_3'}} expected-note {{has a field of a non-trivial class type}}
  S3_3(S3_3 &&);
  S3_2 s32;
};
#ifdef __ORBIS__
// The ClangABI4OrPS4 calling convention kind passes classes in registers if the
// copy constructor is trivial for calls *or deleted*, while other platforms do
// not accept deleted constructors.
static_assert(__is_trivially_relocatable(S3_3), ""); // expected-warning{{deprecated}}
static_assert(!__builtin_is_cpp_trivially_relocatable(S3_3), "");

#else
static_assert(!__is_trivially_relocatable(S3_3), ""); // expected-warning{{deprecated}}
static_assert(!__builtin_is_cpp_trivially_relocatable(S3_3), "");

#endif

// Diagnose invalid trivial_abi even when the type is templated because it has a non-trivial field.
template <class T>
struct __attribute__((trivial_abi)) S3_4 { // expected-warning {{'trivial_abi' cannot be applied to 'S3_4'}} expected-note {{has a field of a non-trivial class type}}
  S3_4(S3_4 &&);
  S3_2 s32;
};
static_assert(!__is_trivially_relocatable(S3_4<int>), ""); // expected-warning{{deprecated}}
static_assert(!__builtin_is_cpp_trivially_relocatable(S3_4<int>), "");


struct S4 {
  int a;
};
static_assert(__is_trivially_relocatable(S4), ""); // expected-warning{{deprecated}}
static_assert(__builtin_is_cpp_trivially_relocatable(S4), "");


struct __attribute__((trivial_abi)) S5 : public virtual S4 { // expected-warning {{'trivial_abi' cannot be applied to 'S5'}} expected-note {{has a virtual base}}
};
static_assert(!__is_trivially_relocatable(S5), ""); // expected-warning{{deprecated}}
static_assert(!__builtin_is_cpp_trivially_relocatable(S5), "");


struct __attribute__((trivial_abi)) S9 : public S4 {
};
static_assert(__is_trivially_relocatable(S9), ""); // expected-warning{{deprecated}}
static_assert(__builtin_is_cpp_trivially_relocatable(S9), "");


struct __attribute__((trivial_abi(1))) S8 { // expected-error {{'trivial_abi' attribute takes no arguments}}
  int a;
};

// Do not warn about deleted ctors  when 'trivial_abi' is used to annotate a template class.
template <class T>
struct __attribute__((trivial_abi)) S10 {
  T p;
};

S10<int *> p1;
static_assert(__is_trivially_relocatable(S10<int>), ""); // expected-warning{{deprecated}}
static_assert(__builtin_is_cpp_trivially_relocatable(S10<int>), "");

static_assert(__is_trivially_relocatable(S10<S3>), ""); // expected-warning{{deprecated}}
static_assert(__builtin_is_cpp_trivially_relocatable(S10<S3>), "");


template <class T>
struct S14 {
  T a;
};

template <class T>
struct __attribute__((trivial_abi)) S15 : S14<T> {
};

S15<int> s15;
static_assert(__is_trivially_relocatable(S15<int>), ""); // expected-warning{{deprecated}}
static_assert(__builtin_is_cpp_trivially_relocatable(S15<int>), "");

static_assert(__is_trivially_relocatable(S15<S3>), ""); // expected-warning{{deprecated}}
static_assert(__builtin_is_cpp_trivially_relocatable(S15<S3>), "");

template <class T>
struct __attribute__((trivial_abi)) S16 {
  S14<T> a;
};
static_assert(__is_trivially_relocatable(S16<int>), ""); // expected-warning{{deprecated}}
static_assert(__builtin_is_cpp_trivially_relocatable(S16<int>), "");

static_assert(__is_trivially_relocatable(S16<S3>), ""); // expected-warning{{deprecated}}
static_assert(__builtin_is_cpp_trivially_relocatable(S16<S3>), "");

S16<int> s16;

template <class T>
struct __attribute__((trivial_abi)) S17 {
};

S17<int> s17;
static_assert(__is_trivially_relocatable(S17<int>), ""); // expected-warning{{deprecated}}
static_assert(__builtin_is_cpp_trivially_relocatable(S17<int>), "");

static_assert(__is_trivially_relocatable(S17<S3>), ""); // expected-warning{{deprecated}}
static_assert(__builtin_is_cpp_trivially_relocatable(S17<S3>), "");


namespace deletedCopyMoveConstructor {
struct __attribute__((trivial_abi)) CopyMoveDeleted { // expected-warning {{'trivial_abi' cannot be applied to 'CopyMoveDeleted'}} expected-note {{copy constructors and move constructors are all deleted}}
  CopyMoveDeleted(const CopyMoveDeleted &) = delete;
  CopyMoveDeleted(CopyMoveDeleted &&) = delete;
};
#ifdef __ORBIS__
static_assert(__is_trivially_relocatable(CopyMoveDeleted), ""); // expected-warning{{deprecated}}
static_assert(!__builtin_is_cpp_trivially_relocatable(CopyMoveDeleted), "");

#else
static_assert(!__is_trivially_relocatable(CopyMoveDeleted), ""); // expected-warning{{deprecated}}
static_assert(!__builtin_is_cpp_trivially_relocatable(CopyMoveDeleted), "");

#endif

struct __attribute__((trivial_abi)) S18 { // expected-warning {{'trivial_abi' cannot be applied to 'S18'}} \
                                          // itanium-note {{'trivial_abi' is disallowed on 'S18' because it has a field of a non-trivial class type}} \
                                          // windows-note {{'trivial_abi' is disallowed on 'S18' because it has a field of a non-trivial class type}} \
                                          // scei-note {{'trivial_abi' is disallowed on 'S18' because its copy constructors and move constructors are all deleted}}
  CopyMoveDeleted a;
};
#ifdef __ORBIS__
static_assert(__is_trivially_relocatable(S18), ""); // expected-warning{{deprecated}}
static_assert(!__builtin_is_cpp_trivially_relocatable(S18), "");
#else
static_assert(!__is_trivially_relocatable(S18), ""); // expected-warning{{deprecated}}
static_assert(!__builtin_is_cpp_trivially_relocatable(S18), "");
#endif

struct __attribute__((trivial_abi)) CopyDeleted {
  CopyDeleted(const CopyDeleted &) = delete;
  CopyDeleted(CopyDeleted &&) = default;
};
#if defined(_WIN64) && !defined(__MINGW32__)
static_assert(!__is_trivially_relocatable(CopyDeleted), ""); // expected-warning{{deprecated}}
static_assert(!__builtin_is_cpp_trivially_relocatable(CopyDeleted), "");

#else
static_assert(__is_trivially_relocatable(CopyDeleted), ""); // expected-warning{{deprecated}}
static_assert(!__builtin_is_cpp_trivially_relocatable(CopyDeleted), "");
#endif

struct __attribute__((trivial_abi)) MoveDeleted {
  MoveDeleted(const MoveDeleted &) = default;
  MoveDeleted(MoveDeleted &&) = delete;
};
static_assert(__is_trivially_relocatable(MoveDeleted), ""); // expected-warning{{deprecated}}
static_assert(!__builtin_is_cpp_trivially_relocatable(MoveDeleted), "");
struct __attribute__((trivial_abi)) S19 { // expected-warning {{'trivial_abi' cannot be applied to 'S19'}} \
                                          // itanium-note {{'trivial_abi' is disallowed on 'S19' because its copy constructors and move constructors are all deleted}} \
                                          // windows-note {{'trivial_abi' is disallowed on 'S19' because it has a field of a non-trivial class type}} \
                                          // scei-note {{'trivial_abi' is disallowed on 'S19' because its copy constructors and move constructors are all deleted}}
  CopyDeleted a;
  MoveDeleted b;
};
#ifdef __ORBIS__
static_assert(__is_trivially_relocatable(S19), ""); // expected-warning{{deprecated}}
static_assert(!__builtin_is_cpp_trivially_relocatable(S19), "");
#else
static_assert(!__is_trivially_relocatable(S19), ""); // expected-warning{{deprecated}}
static_assert(!__builtin_is_cpp_trivially_relocatable(S19), "");
#endif

// This is fine since the move constructor isn't deleted.
struct __attribute__((trivial_abi)) S20 {
  int &&a; // a member of rvalue reference type deletes the copy constructor.
};
#if defined(_WIN64) && !defined(__MINGW32__)
static_assert(!__is_trivially_relocatable(S20), ""); // expected-warning{{deprecated}}
static_assert(!__builtin_is_cpp_trivially_relocatable(S20), "");

#else
static_assert(__is_trivially_relocatable(S20), ""); // expected-warning{{deprecated}}
static_assert(!__builtin_is_cpp_trivially_relocatable(S20), "");

#endif
} // namespace deletedCopyMoveConstructor
