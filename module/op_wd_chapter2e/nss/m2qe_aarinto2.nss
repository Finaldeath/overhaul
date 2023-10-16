void main()
{
    int nPlot = GetLocalInt(GetModule(), "Chapter2_Aribeth_Falls");
    if(nPlot == 0)
    {
        SetLocalInt(GetModule(), "Chapter2_Aribeth_Falls", 1);
    }

    //::///////////////////////////////////////////////
    //:: mpatchcutscene
    //:: Copyright (c) 2001 Bioware Corp.
    //:://////////////////////////////////////////////
    /*
        The host tower cutscene was started.
        OnModuleLoad() will check this variable.
        If it is set to 10 the it means that a
        savegame was loaded in the middle of a cutscene.
    */
    //:://////////////////////////////////////////////
    //:: Created By:
    //:: Created On:
    //:://////////////////////////////////////////////

    object oMorag = GetObjectByTag("2Q6K_MORAG", 0);
    if(GetObjectType(oMorag) != OBJECT_TYPE_CREATURE)
    {
        oMorag = GetObjectByTag("2Q6K_MORAG", 1);
    }
    if (GetLocalInt(GetModule(),"NW_PATCH_CUTSCENE") == 10)
    {
        if (GetIsObjectValid(oMorag) == TRUE)
        {
            ExecuteScript("2q6k_startfight", oMorag);
        }
    }
}
