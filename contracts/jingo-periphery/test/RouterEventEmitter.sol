pragma solidity =0.6.6;

import "../interfaces/IJingoRouter.sol";

contract RouterEventEmitter {
    event Amounts(uint256[] amounts);

    receive() external payable {}

    function swapExactTokensForTokens(
        address router,
        uint256 amountIn,
        uint256 amountOutMin,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external {
        (bool success, bytes memory returnData) = router.delegatecall(
            abi.encodeWithSelector(
                IJingoRouter(router).swapExactTokensForTokens.selector,
                amountIn,
                amountOutMin,
                path,
                to,
                deadline
            )
        );
        assert(success);
        emit Amounts(abi.decode(returnData, (uint256[])));
    }

    function swapTokensForExactTokens(
        address router,
        uint256 amountOut,
        uint256 amountInMax,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external {
        (bool success, bytes memory returnData) = router.delegatecall(
            abi.encodeWithSelector(
                IJingoRouter(router).swapTokensForExactTokens.selector,
                amountOut,
                amountInMax,
                path,
                to,
                deadline
            )
        );
        assert(success);
        emit Amounts(abi.decode(returnData, (uint256[])));
    }

    function swapExactSYSForTokens(
        address router,
        uint256 amountOutMin,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external payable {
        (bool success, bytes memory returnData) = router.delegatecall(
            abi.encodeWithSelector(
                IJingoRouter(router).swapExactSYSForTokens.selector,
                amountOutMin,
                path,
                to,
                deadline
            )
        );
        assert(success);
        emit Amounts(abi.decode(returnData, (uint256[])));
    }

    function swapTokensForExactSYS(
        address router,
        uint256 amountOut,
        uint256 amountInMax,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external {
        (bool success, bytes memory returnData) = router.delegatecall(
            abi.encodeWithSelector(
                IJingoRouter(router).swapTokensForExactSYS.selector,
                amountOut,
                amountInMax,
                path,
                to,
                deadline
            )
        );
        assert(success);
        emit Amounts(abi.decode(returnData, (uint256[])));
    }

    function swapExactTokensForSYS(
        address router,
        uint256 amountIn,
        uint256 amountOutMin,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external {
        (bool success, bytes memory returnData) = router.delegatecall(
            abi.encodeWithSelector(
                IJingoRouter(router).swapExactTokensForSYS.selector,
                amountIn,
                amountOutMin,
                path,
                to,
                deadline
            )
        );
        assert(success);
        emit Amounts(abi.decode(returnData, (uint256[])));
    }

    function swaJGOForExactTokens(
        address router,
        uint256 amountOut,
        address[] calldata path,
        address to,
        uint256 deadline
    ) external payable {
        (bool success, bytes memory returnData) = router.delegatecall(
            abi.encodeWithSelector(
                IJingoRouter(router).swaJGOForExactTokens.selector,
                amountOut,
                path,
                to,
                deadline
            )
        );
        assert(success);
        emit Amounts(abi.decode(returnData, (uint256[])));
    }
}
