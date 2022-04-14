// SPDX-License-Identifier: GPL-3.0

// Created by HashLips
// The Nerdy Coder Clones

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/cryptography/MerkleProof.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/finance/PaymentSplitter.sol";

contract NewFace is ERC721Enumerable, Ownable {
  using Strings for uint256;

  string public baseURI;
  string public baseExtension = ".json";
  uint256 public maxSupply = 15;

  constructor() ERC721("Kering Comex Avatars", "KCA") {
    setBaseURI("ipfs://QmaxRsSpUHif3ZMGgpbDwE1Bfk21W5NEgohBC6EQqboKkE/");
    _transferOwnership(0x36C2B714De2cBbBFd01499E9e53699f87d5cd6a7); // Vrai propriétaire : 0x36C2B714De2cBbBFd01499E9e53699f87d5cd6a7
      
    mint(0x0ba6dE2195E4B735d35541e8b6c26DfCe299FdF2, 1); // FHP#1
    mint(0xC631C0c9f5D6A68d17bff01A9252DCe80844164a, 1); // JFP#2
    mint(0x340881736727F32180D4CB331579ce646D5bb2E6, 1); // FB#3
    mint(0xF6eDe486942cd31f8BB49e8dc45014D70feb9097, 1); // MB#4
    mint(0x65ACD0A39CEC7843c907d27A8e381B9F8E93b986, 1); // GB#5
    mint(0xFd106FB1798326205BDD3C81c78cE554661A7eFb, 1); // CC#6
    mint(0x7e30985236F11A32d59EFfE91C7344e22498B044, 1); // MCD#7
    mint(0x12643d691877CB3fDA523BC50f6c2BaeB871eB7C, 1); // JMD#8
    mint(0xc616018A3372543627a15028961F940C0D7c4dE3, 1); // VD#9
    mint(0x99cE6D3587DFA5CaB9b9e7e84AD72f6b0AA01546, 1); // BL#10
    mint(0x1a323fdF4fF01ed9D26a225BDC68F3e6f95C63f8, 1); // BR#11
    mint(0x208Eda17886c03243735700e70BB16870E5413f9, 1); // RV#12
    mint(0xa35288FeCCdB579D5A998fA1c415DDd06Ab22708, 1); // BL#13
    mint(0x36C2B714De2cBbBFd01499E9e53699f87d5cd6a7, 1); // AL#14 // Vrai propriétaire : 0x36C2B714De2cBbBFd01499E9e53699f87d5cd6a7
    mint(0x36C2B714De2cBbBFd01499E9e53699f87d5cd6a7, 1); // LD#15 // Vrai propriétaire : 0x36C2B714De2cBbBFd01499E9e53699f87d5cd6a7
  }
 
  // internal
  function _baseURI() internal view virtual override returns (string memory) {
    return baseURI;
  }

  // public
  function mint(address _to, uint256 _mintAmount)  public onlyOwner{
    uint256 supply = totalSupply();
    require(_mintAmount > 0);
    require(supply + _mintAmount <= maxSupply);

    for (uint256 i = 1; i <= _mintAmount; i++) {
      _safeMint(_to, supply + i);
    }
  }

  function walletOfOwner(address _owner)
    public
    view
    returns (uint256[] memory)
  {
    uint256 ownerTokenCount = balanceOf(_owner);
    uint256[] memory tokenIds = new uint256[](ownerTokenCount);
    for (uint256 i; i < ownerTokenCount; i++) {
      tokenIds[i] = tokenOfOwnerByIndex(_owner, i);
    }
    return tokenIds;
  }

  function tokenURI(uint256 tokenId)
    public
    view
    virtual
    override
    returns (string memory)
  {
    require(
      _exists(tokenId),
      "ERC721Metadata: URI query for nonexistent token"
    );

    string memory currentBaseURI = _baseURI();
    return bytes(currentBaseURI).length > 0
        ? string(abi.encodePacked(currentBaseURI, tokenId.toString(), baseExtension))
        : "";
  }

  //only owner


    function setBaseURI(string memory _newBaseURI) public onlyOwner {
        baseURI = _newBaseURI;
    }

    function setBaseExtension(string memory _newBaseExtension) public onlyOwner { // .json
        baseExtension = _newBaseExtension;
    }

     function setMaxSupply(uint _maxSupply) public onlyOwner { // .json
        maxSupply = _maxSupply;
    }

 
//////////////////////////////
function gift(address[] calldata addresses) public onlyOwner {
        require(addresses.length > 0, "RUDE KIDZ : Need to gift at least 1 NFT");
        for (uint256 i = 0; i < addresses.length; i++) {
          _safeMint(addresses[i], 1);
        }
    }


}
