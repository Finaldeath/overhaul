//::///////////////////////////////////////////////
//:: Alias Story
//:: act_ali_story
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Alias has told her story
*/
//:://////////////////////////////////////////////
//:: Created By: Cori
//:: Created On: Sept 2003
//:://////////////////////////////////////////////

void main()
{
    object oMom = GetObjectByTag("q2_mommaji");
    object oDoor = GetObjectByTag("q1ab_at_q3ak2");
    object oMap = GetObjectByTag("q1_map_illithid");
    SetMapPinEnabled(oMap,1);
    SetLocked(oDoor,FALSE);
    SetPlotFlag(oMom,FALSE);
    SetImmortal(oMom,FALSE);
    DestroyObject(oMom);
    SetLocalInt(OBJECT_SELF,"OS_ALIAS_STORY",20);

}
