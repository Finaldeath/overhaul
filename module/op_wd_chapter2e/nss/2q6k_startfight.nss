//::///////////////////////////////////////////////
//:: Start End Fight
//:: 2q6_startfight
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Makes the lizardmen hostile.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: March , 18, 2002
//:://////////////////////////////////////////////

#include "nw_i0_hostincl"

void main()
{
    // * BK (July 2002)signify that the cutscene has ended properly.
    SetLocalInt(GetModule(),"NW_PATCH_CUTSCENE",0);



    location lLocal = GetLocation(OBJECT_SELF);

    SetLocalInt(GetArea(OBJECT_SELF), "NW_2Q6_CUT_SCENE_START", 15);
    SetLocalInt(GetModule(),"Chapter2_End",1);

    ActionCastFakeSpellAtObject(SPELL_MORDENKAINENS_DISJUNCTION, OBJECT_SELF);
    effect eVis = EffectVisualEffect(VFX_FNF_DISPEL_DISJUNCTION);
    DelayCommand(1.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, lLocal));
    object oAribeth = GetNearestObjectByTag("2Q6K_AribethEvil");
    if(!GetIsObjectValid(oAribeth))
    {
        oAribeth = GetNearestObjectByTag("2Q6K_Aribeth");
    }
    object oMaugrim = GetNearestObjectByTag("2Q6K_Maugrim");
    object oWay = GetWaypointByTag("2Q6K_MORAG");
    DelayCommand(2.0, CreateObjectVoid(OBJECT_TYPE_CREATURE, "2q6k_gorgoth", GetLocation(oWay)));
    DestroyObject(oAribeth, 2.0);
    DestroyObject(oMaugrim, 2.0);
    DestroyObject(OBJECT_SELF, 7.0);

    object oDoor = GetNearestObjectByTag("2q6k_fencegate");
    AssignCommand(oDoor, ActionOpenDoor(oDoor));

    SpeakString("NW_CALL_TO_ARMS", TALKVOLUME_SILENT_SHOUT);

    object oPC = GetFirstPC();//GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
    if(GetIsObjectValid(oPC))
    {
        AddJournalQuestEntry("m2q0_Main", 90, oPC);
    }
}
