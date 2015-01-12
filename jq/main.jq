import "joelpurra/jq-counter-buckets" as CounterBucket;

# TODO: create a math package.
def asPercentageInteger:
	. * 100
	| tostring
	| split(".")
	| .[0]
	| tonumber;

def create:
	# Assuming decimal numbers [0,1].
	# 101 buckets because it's [0,100].
	CounterBucket::create(101);

def increment($ratio; $count):
	($ratio | asPercentageInteger) as $index
	| CounterBucket::increment($index; $count);

def increment($ratio):
	increment($ratio; 1);
