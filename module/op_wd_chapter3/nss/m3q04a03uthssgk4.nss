int StartingConditional()
{
    int iResult;
    int nDead = GetLocalInt(GetModule(),"NW_G_M3Q4A_UTHGARDTDEAD");
    int nAlive = 3 - nDead;
    iResult = GetLocalInt(GetModule(),"NW_G_M3Q04PLOTHEALED") >= nAlive &&
              GetLocalObject(GetModule(),"M3Q04CPCHEALER") == GetPCSpeaker()
              && nAlive != 0
              && GetLocalInt(OBJECT_SELF,"NW_G_M3Q4A_HEALED")==0;
    return iResult;
}
