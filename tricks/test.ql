import "tricks"

// ---------------------------------

Foo = class {
}

tricks.of(Foo).inject({
	"f": fn(this, a) {
		this.a = a
	},
})

foo = new Foo

foo.f(3)

println(foo.a)

if foo.a != 3 {
	panic("foo.a != 3")
}

// ---------------------------------

Bar = class {
	fn g() {
		return this.a
	}
	fn h(a) {
		this.f(a+1)
	}
}

tricks.of(Bar).inherit(Foo)

bar = new Bar

bar.h(3)

println(bar.g())

if bar.g() != 4 {
	panic("bar.g() != 4")
}

// ---------------------------------
