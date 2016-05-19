import "tricks"

// ---------------------------------

Foo = class {
	fn _init() {
		this.a = 1
	}
}

tricks.inject(Foo, {
	"f": fn(this, a) {
		this.a = a
	},
})

foo = new Foo
if foo.a != 1 {
	panic("foo.a != 1")
}

foo.f(3)
println(foo.a)
if foo.a != 3 {
	panic("foo.a != 3")
}

// ---------------------------------

Bar = class {
	fn _init() {
		Foo._init(this)
		this.b = 2
	}

	fn g() {
		return this.a + this.b
	}

	fn h(a) {
		this.f(a + 1)
	}
}

tricks.inherit(Bar, Foo)

bar = new Bar
if bar.a != 1 || bar.b != 2 {
	panic("bar.a != 1 || bar.b != 2")
}

bar.h(3)

println(bar.g())
if bar.g() != 6 {
	panic("bar.g() != 6")
}

// ---------------------------------
