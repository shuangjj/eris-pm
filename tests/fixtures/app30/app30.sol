contract multiReturn {

	function getInts() returns (uint, uint) {
  		return (1, 2);
	}
	function getStrings() returns (string filename, string username) {
		filename = "PlansForWorldDomination.md";
		username = "DougTheMarmot";
	}
	function getBools() returns (bool, bool) {
		return (true, false);
	}
	function getBytes() returns (bytes32, bytes32) {
		return ("Hello", "World");
	}
	function getInterMixed() 
		returns (
			string filename,
			bool isPresent, 
			uint copies, 
			string username, 
			bytes crypto
		) {
		filename = "PranksAndStuff.js";
		copies = 3;
		isPresent = true;
		username = "DougTheMarmot";
		crypto = "0x36PrZ1KHYMpqSyAQXSG8VwbUiq2EogxLo2";
	}
}

