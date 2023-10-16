//* Jax at Mercenary Camp and still has key
//* #include "NW_I0_PLOT"

int StartingConditional()
{
	int l_iResult;

	l_iResult = GetLocalInt(GetModule(),"M2Q1JaxAtMercCamp") == 1 &&  GetLocalInt(GetModule(),"M2Q1JaxLeavesInn") == 2
                && GetIsObjectValid(GetItemPossessedBy(OBJECT_SELF,"M2Q2ITKEYTEMPLE"));
	return l_iResult;
}
