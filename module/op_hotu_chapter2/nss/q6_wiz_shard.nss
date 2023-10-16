//Player has collected the shard from the wizard's apprentice

int StartingConditional()
{
    int iResult;

    iResult = GetLocalInt(GetObjectByTag("q6_jansil"),"NW_L_TALKLEVEL")>=1 &&
                GetLocalInt(OBJECT_SELF,"Jansil_Dead")==0;
    return iResult;
}
