//::///////////////////////////////////////////////
//:: Checks that the ritual is completed.
//:: Copyright (c) 2002 Bioware Corp.
//:://////////////////////////////////////////////

int StartingConditional()
{
    return GetLocalInt(GetModule(),"NW_G_M1Q6A01RitualComplete")!=0;
}
