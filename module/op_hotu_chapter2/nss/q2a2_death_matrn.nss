//::///////////////////////////////////////////////
//:: Name q2a2_death_matrn
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Default OnDeath script
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: June 11/03
//:://////////////////////////////////////////////

#include "nw_i0_plot"

void ClearAOE(object oCreature);
void main()
{
    if (GetLocalInt(OBJECT_SELF, "nDieOnce") == 1)
        return;

    SetLocalInt(OBJECT_SELF, "nDieOnce", 1);

    //if the Matron dies during the Zesyyr Betrayal Plot then run the
    //Zesyyr entering cutscene (once the Matron and Tebomir are both
    //dead.
    if (GetLocalInt(OBJECT_SELF, "X2_RunZesPlotCutscene") == 1)
    {
        //check to see if Tebomir is dead too
        object oTebomir = GetObjectByTag("q2amaecapt");
        if (GetIsObjectValid(oTebomir) == FALSE || GetIsDead(oTebomir) == TRUE)
        {
            //Run cutscene
            object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);

            object oMatGuard1 = GetObjectByTag("cut108_guard5");
            object oMatGuard2 = GetObjectByTag("cut108_guard6");
            //if either of the two guards are still alive - they run away
            if (GetIsObjectValid(oMatGuard1) == TRUE)
            {
                SetLocalInt(oMatGuard1, "nRetreat", 1);
                AssignCommand(oMatGuard1, ClearAllActions(TRUE));
                AssignCommand(oMatGuard1, PlayVoiceChat(VOICE_CHAT_FLEE));

                AssignCommand(oMatGuard1, ActionMoveAwayFromObject(oPC, TRUE));

                DestroyObject(oMatGuard1, 5.0);
            }
            if (GetIsObjectValid(oMatGuard2) == TRUE)
            {
                SetLocalInt(oMatGuard2, "nRetreat", 1);
                AssignCommand(oMatGuard2, ClearAllActions(TRUE));

                AssignCommand(oMatGuard2, ActionMoveAwayFromObject(oPC, TRUE));

                DestroyObject(oMatGuard2, 5.0);
            }
            ClearAOE(OBJECT_SELF);
            ExecuteScript("cutscene116", oPC);
            return;
        }
    }

    //if the Matron has died during the House maeviir Betrayal fight
    //this variable should be set to 2
    //(the House maeviir Matron dies)
    if (GetLocalInt(GetModule(), "X2_Q2ABattle2Wave1") == 1)
    {
        SetLocalInt(GetModule(), "X2_Q2ABattle2Wave1", 2);

        object oSeer = GetObjectByTag("q2aseer");
        SetImmortal(oSeer, TRUE);

        SetLocalInt(GetModule(), "X2_Q2ABattle2_Maeviir", 2);
        object oTebomir = GetObjectByTag("q2amaecapt");
        object oGuard1 = GetObjectByTag("cut108_guard1");
        object oGuard2 = GetObjectByTag("cut108_guard2");
        object oGuard3 = GetObjectByTag("cut108_guard3");
        object oGuard4 = GetObjectByTag("cut108_guard4");
        object oGuard5 = GetObjectByTag("cut108_guard5");
        object oGuard6 = GetObjectByTag("cut108_guard6");
        object oGuard7 = GetObjectByTag("cut108_guard7");
        object oGuard8 = GetObjectByTag("cut108_guard8");
        object oGuard9 = GetObjectByTag("cut108_guard9");
        object oGuard10 = GetObjectByTag("cut108_guard10");

        object oPC = GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC);
        //KLUDGE
        object oKiller = GetLastKiller();
        AssignCommand(oKiller, ClearAllActions(TRUE));

        //Clear the area around the seer of AOE spells
        ClearAOE(oSeer);
        AssignCommand(oPC, ClearAllActions(TRUE));
        AssignCommand(oSeer, ClearAllActions(TRUE));
        AssignCommand(oSeer, ActionStartConversation(oPC));

        //Have the Seer continue to try and talk with the PC
        SetLocalInt(oSeer, "nWantToTalk", 1);

        if (GetIsObjectValid(oGuard1) == TRUE)
        {
            SetLocalInt(oGuard1, "nRetreat", 1);
            AssignCommand(oGuard1, ClearAllActions(TRUE));
            AssignCommand(oGuard1, PlayVoiceChat(VOICE_CHAT_FLEE));

            AssignCommand(oGuard1, ActionMoveAwayFromObject(oPC, TRUE));

            DestroyObject(oGuard1, 5.0);
        }
        if (GetIsObjectValid(oGuard2) == TRUE)
        {
            SetLocalInt(oGuard2, "nRetreat", 1);
            AssignCommand(oGuard2, ClearAllActions(TRUE));
            AssignCommand(oGuard2, PlaySpeakSoundByStrRef(100934));//"Flee, Matron Myrune is dead!"));
            AssignCommand(oGuard2, ActionMoveAwayFromObject(oPC, TRUE));

            DestroyObject(oGuard2, 5.0);
        }
        if (GetIsObjectValid(oGuard3) == TRUE)
        {
            SetLocalInt(oGuard3, "nRetreat", 1);
            AssignCommand(oGuard3, ClearAllActions(TRUE));

            AssignCommand(oGuard3, ActionMoveAwayFromObject(oPC, TRUE));

            DestroyObject(oGuard3, 5.0);
        }
        if (GetIsObjectValid(oGuard4) == TRUE)
        {
            SetLocalInt(oGuard4, "nRetreat", 1);
            AssignCommand(oGuard4, ClearAllActions(TRUE));

            AssignCommand(oGuard4, ActionMoveAwayFromObject(oPC, TRUE));

            DestroyObject(oGuard4, 5.0);
        }
        if (GetIsObjectValid(oGuard5) == TRUE)
        {
            SetLocalInt(oGuard5, "nRetreat", 1);
            AssignCommand(oGuard5, ClearAllActions(TRUE));
            AssignCommand(oGuard2, PlaySpeakSoundByStrRef(100935));//"Flee, The matron has fallen!"));
            AssignCommand(oGuard5, ActionMoveAwayFromObject(oPC, TRUE));

            DestroyObject(oGuard5, 5.0);
        }
        if (GetIsObjectValid(oGuard6) == TRUE)
        {
            SetLocalInt(oGuard6, "nRetreat", 1);
            AssignCommand(oGuard6, ClearAllActions(TRUE));

            AssignCommand(oGuard6, ActionMoveAwayFromObject(oPC, TRUE));

            DestroyObject(oGuard6, 6.0);
        }
        if (GetIsObjectValid(oGuard7) == TRUE)
        {
            SetLocalInt(oGuard7, "nRetreat", 1);
            AssignCommand(oGuard7, ClearAllActions(TRUE));

            AssignCommand(oGuard7, ActionMoveAwayFromObject(oPC, TRUE));

            DestroyObject(oGuard7, 7.0);
        }
        if (GetIsObjectValid(oGuard8) == TRUE)
        {
            SetLocalInt(oGuard8, "nRetreat", 1);
            AssignCommand(oGuard8, ClearAllActions(TRUE));
            AssignCommand(oGuard2, PlaySpeakSoundByStrRef(100936));//"Run, before Zessyr returns!"));
            AssignCommand(oGuard8, ActionMoveAwayFromObject(oPC, TRUE));

            DestroyObject(oGuard8, 6.0);
        }
        if (GetIsObjectValid(oGuard9) == TRUE)
        {
            SetLocalInt(oGuard9, "nRetreat", 1);
            AssignCommand(oGuard9, ClearAllActions(TRUE));

            AssignCommand(oGuard9, ActionMoveAwayFromObject(oPC, TRUE));

            DestroyObject(oGuard9, 5.0);
        }
        if (GetIsObjectValid(oGuard10) == TRUE)
        {
            SetLocalInt(oGuard10, "nRetreat", 1);
            AssignCommand(oGuard10, ClearAllActions(TRUE));

            AssignCommand(oGuard10, ActionMoveAwayFromObject(oPC, TRUE));

            DestroyObject(oGuard10, 5.0);
        }
        if (GetIsObjectValid(oTebomir) == TRUE)
        {
            SetLocalInt(oTebomir, "nRetreat", 1);
            AssignCommand(oTebomir, ClearAllActions(TRUE));
            AssignCommand(oTebomir, ActionMoveAwayFromObject(oPC, TRUE));

            DestroyObject(oTebomir, 5.0);
        }
        return;
    }

    //Change background music
    object oArea = GetArea(OBJECT_SELF);
    MusicBackgroundChangeDay(oArea, TRACK_CASTLE);
    MusicBackgroundChangeNight(oArea, TRACK_CASTLE);
    MusicBackgroundPlay(oArea);

    ExecuteScript("nw_c2_default7", OBJECT_SELF);
}

//Clear  a sphere around a creature of all area of effect spells
void ClearAOE(object oCreature)
{
    //Get the spell target location as opposed to the spell target.
    location lTarget = GetLocation(oCreature);

    //Declare the spell shape, size and the location.  Capture the first target object in the shape.
    object oTarget = GetFirstObjectInShape(SHAPE_CUBE, RADIUS_SIZE_COLOSSAL, lTarget, FALSE, OBJECT_TYPE_AREA_OF_EFFECT);


    //Cycle through the targets within the spell shape until an invalid object is captured.
    while (GetIsObjectValid(oTarget))
    {
        if (GetObjectType(oTarget) == OBJECT_TYPE_AREA_OF_EFFECT)
        {
            DestroyObject(oTarget);
        }

       //Select the next target within the spell shape.
       oTarget = GetNextObjectInShape(SHAPE_CUBE, RADIUS_SIZE_COLOSSAL, lTarget, FALSE, OBJECT_TYPE_AREA_OF_EFFECT);
    }
}
