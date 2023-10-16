int StartingConditional()
{
    return GetLocalInt(GetModule(),"NW_G_TookZorEar") == 10 &&
           GetLocalInt(GetModule(),"NW_G_TookStirgeEar") == 10 &&
           GetLocalInt(GetModule(),"NW_G_TookWyvernEar") == 10 &&
           GetLocalInt(GetModule(),"NW_G_TookDelilahEar") == 10;
}
