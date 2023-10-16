int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetModule(),"NW_G_M3Q2PLOTULTARGSEEDSPLANTED") ==1 &&
              GetLocalObject(GetModule(), "M3Q2CULTARGTREE") != GetPCSpeaker();
    return iResult;
}
