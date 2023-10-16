//::///////////////////////////////////////////////
//:: Name: q2e_exit_area
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Set variable on PC that they have left hell -
    for geaozil's conversation
*/
//:://////////////////////////////////////////////
//:: Created By:Keith Warner
//:: Created On:Nov 20/02
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetExitingObject();
    DestroyObject(GetObjectByTag("D" + GetName(GetPCSpeaker())));
    DestroyObject(GetObjectByTag("L" + GetName(GetPCSpeaker())));
    SetLocalInt(oPC,"NW_PCINHELL",0);
/*
    int nCount = 0;
    object oPC2 = GetFirstPC();
    while (oPC2 != OBJECT_INVALID)
    {
        if (GetTag(GetArea(oPC2)) == "x2_reaper1")
            nCount = nCount + 1;
        oPC2 = GetNextPC();
    }
    if (nCount < 2)
    {
        SetLocalInt(GetModule(), "nQ2EMOBEvilCOUNT", 0);//good MOB
        SetLocalInt(GetModule(), "nQ2EMOBGoodCOUNT", 0);//evil MOB

        object oArea = GetObjectByTag("x2_reaper1");
        object oCreature = GetFirstObjectInArea(oArea);
        while (oCreature != OBJECT_INVALID)
        {
            if (GetStringLeft(GetTag(oCreature), 8) == "q2e_good" || GetStringLeft(GetTag(oCreature), 8) == "q2e_evil" || GetTag(oCreature) == "q2ebear" || GetTag(oCreature) == "q2edeer" || GetTag(oCreature) == "q2ewolf")
                DestroyObject(oCreature);
            oCreature = GetNextObjectInArea(oArea);
        }
    }
*/
}
