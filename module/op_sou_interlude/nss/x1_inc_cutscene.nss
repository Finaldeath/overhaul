///////////////////////////////////////////////////////
//:: Name - x1_inc_cutscene
//:: Copyright (c) 2001 Bioware Corp.
///////////////////////////////////////////////////////
/*
   This is the cutscene include file that contains many
   useful functions when doing cutscenes. The uses are
   described before each function.

   Each function will be in a wrapper function that will
   check to see if the cutscene has been aborted yet or
   not.

   There is an added variable called iShift. This can be
   ignored in all cases, except when the GetShift function
   is being called. It was added so that when a shift is
   done, you can insert stuff (the reason for the shift)
   into your script without the new stuff being shifted.

   An example of this: You decide you need to add 20
   seconds of material in the middle of your cutscene.
   You need to do this at the 1 minute mark, and you
   want to shift everything after that point by 20 secs.
   The new stuff you add there for that 20 secs will
   get shifted as well since you called the shift. But
   by adding FALSE at the end of the function call, it
   will ignore the shift amount.

   Also, if anything after the shift is something that
   you don't want adjusted from the default, use this
   there as well.
*/
///////////////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Dec 9, 2002
///////////////////////////////////////////////////////

// Used to shift the entire cutscene a length of time. Used internally here,
// but very handy for cutscenes that are complete, but need to be changed
// after the fact. From the point it is called, it just shifts the cutscene
// accordingly. Can be used (and should be) for non-cutscene delays in a
// script (ie - commands that aren't here or regular DelayCommands in a script.)

//UPDATE Jan 8/03 :Keith Warner: The integer nCutscene is now passed in to all cutscene functions.
//This is so that if a player skips one cutscene and then very soon after enters another
//cutscene, we need to be able to check which cutscene a delayed function belongs to.
//If it is not the cutscene that the PC is currently in - the delayed actions that effect the
//PC should NOT take place
/*

// UPDATE Jan 14, 2003: Brad Prince: Added a few new functions listed below.
// Also, for ApplyEffect functions, there is no need to specify a duration
// if you don't need one. It will default now.
// CutSetCutsceneMode will now destroy any associates, except henchmen, which
// will be dealt with in the future.
// * PLEASE NOTE * With Keith's update, the examples below should all be
// preceeded with the nCutscene int.

//FUNCTION LIST
float GetShift(object oObject, int iShift)
void RemoveCommandable(object oPC)
void CutRemoveEffects(int nCutscene, float fDelay, object oObject, int iShift = TRUE)
void CutActionStartConversation(int nCutscene, float fDelay, object oNPC, object oPC, string szConversationFile, int iShift = TRUE)
void CutSpeakString(int nCutscene, float fDelay, object oSpeaker, string szString, int iShift = TRUE)
void CutSpeakStringByStrRef(int nCutscene, float fDelay, object oSpeaker, int nStrRef, int iShift = TRUE)
void CutPlayAnimation(int nCutscene, float fDelay, object oObject, int nAnimation, float fLength, int iShift = TRUE)
void CutJumpToLocation(int nCutscene, float fDelay, object oPC, location lLoc, int iShift = TRUE)
void CutJumpToObject(int nCutscene, float fDelay, object oPC, object oObject, int iShift = TRUE)
void CutActionMoveToObject(int nCutscene, float fDelay, object oPC, object oTarget, int iRun, int iShift = TRUE)
void CutActionMoveToLocation(int nCutscene, float fDelay, object oPC, location lLoc, int iRun, int iShift = TRUE)
void CutCreateObject(int nCutscene, float fDelay, object oPC, int iType, string sName, location lLoc, int iEffect, int iShift = TRUE)
void CutSetFacingPoint(int nCutscene, float fDelay, object oPC, string szTag, int iShift = TRUE)
void CutFadeOutAndIn(int nCutscene, float fDelay, object oObject, int iShift = TRUE)
void CutFadeToBlack(int nCutscene, float fDelay, object oObject, int iShift = TRUE)
void CutFadeFromBlack(int nCutscene, float fDelay, object oObject, int iShift = TRUE)
void CutSetCamera(int nCutscene, float fDelay, object oObject, int iCameraType, float fFacing, float fZoom, float fPitch, int nSpeed, int iShift = TRUE)
void CutClearAllActions(int nCutscene, float fDelay, object oObject, int iShift = TRUE)
void CutApplyEffectAtLocation(int nCutscene, float fDelay, object oObject, int iDur, int iEffect, location lLoc, float fDur, int iShift = TRUE)
void CutApplyEffectToObject(int nCutscene, float fDelay, int iDur, int iEffect, object oObject, float fDur, int iShift = TRUE)
void CutApplyEffectToObject2(int nCutscene, float fDelay, int iDur, effect eEffect, object oObject, float fDur, int iShift = TRUE)
void CutKnockdown(int nCutscene, float fDelay, object oObject, float fDur, int iShift = TRUE)
void CutDeath(int nCutscene, float fDelay, object oObject, int iSpec, int iShift = TRUE)
void CutActionCastFakeSpellAtObject(int nCutscene, float fDelay, int iSpell, object oObject, object oTarget, int iPath, int iShift = TRUE)
void CutActionCastFakeSpellAtLocation(int nCutscene, float fDelay, int iSpell, object oObject, location lLoc, int iPath, int iShift = TRUE)
void CutSetLocation(int nCutscene, float fDelay, object oPC, int iShift = TRUE)
void CutRestoreLocation(int nCutscene, float fDelay, object oPC, int iShift = TRUE)
void CutSetCutsceneMode(int nCutscene, float fDelay, object oPC, int iValue, int iShift = TRUE, int bKeepAssociate = FALSE)
void CutSetPlotFlag(int nCutscene, float fDelay, object oObject, int iValue, int iShift = TRUE)
void CutDestroyObject(int nCutscene, float fDelay, object oObject, int iShift = TRUE)
void CutStoreCameraFacing(int nCutscene, float fDelay, object oPC, int iShift = TRUE)
void CutRestoreCameraFacing(int nCutscene, float fDelay, object oPC, int iShift = TRUE)
void CutBlackScreen(int nCutscene, float fDelay, object oPC, int iShift = TRUE)
void CutStopFade(int nCutscene, float fDelay, object oPC, int iShift = TRUE)
void CutPlaySound(int nCutscene, float fDelay, object oPC, string szSound, int iShift = TRUE)
*/
float GetShift(object oObject, int iShift)
{
        float fShift;
        if(iShift != FALSE)
             fShift = GetLocalFloat(GetArea(oObject), "cut_shift");
        else
             fShift = 0.0;
        return fShift;
}

// Used to clear commandable state FALSE in the event there are too many
// Used in this include only.
void RemoveCommandable(object oPC)
{
        while(GetCommandable(oPC) == FALSE)
             SetCommandable(TRUE, oPC);
}


// Used to remove all effects from an object.
/* Example: CutRemoveEffects(10.5, GetObjectByTag("guard1")); would
   remove all effects from guard1 after a 10.5 second delay.
*/
void CallRemoveEffects(int nCutscene, object oObject)
{
    if (GetLocalInt(GetModule(), "nCut" + IntToString(nCutscene) + "Aborted") != 1)
    {
        if(GetIsPC(oObject))
        {
            if(nCutscene == GetLocalInt(oObject, "nCutsceneNumber"))
            {
                effect eEff = GetFirstEffect(oObject);
                while(GetIsEffectValid(eEff))
                {
                    if( GetEffectCreator(eEff) == OBJECT_SELF)
                        RemoveEffect(oObject, eEff);
                    eEff = GetNextEffect(oObject);
                }
            }
        }
        else
        {
            effect eEff1 = GetFirstEffect(oObject);
            while(GetIsEffectValid(eEff1))
            {
                RemoveEffect(oObject, eEff1);
                eEff1 = GetNextEffect(oObject);
            }
        }
    }
}

void CutRemoveEffects(int nCutscene, float fDelay, object oObject, int iShift = TRUE)
{
        DelayCommand(fDelay, DelayCommand(GetShift(oObject, iShift), CallRemoveEffects(nCutscene, oObject)));
}

// Used for a conversation file when you need to have an NPC speak
// via a conversation instead of bubble text. The fDelay is used
// when timing is important.
//
/* Example: CutActionStartConversation(5.0, oNPC, oPC, "my_conv"); would start the
   conversation file "my_conv" of the NPC, after a 5 sec delay, and
   the conversation subject would be the PC.
*/
void CallActionStartConversation(int nCutscene, object oNPC, object oPC, string szConversationFile)
{
        if(nCutscene == GetLocalInt(oPC, "nCutsceneNumber"))
        {
            CutRemoveEffects(nCutscene, 0.0, oPC);
            SetCommandable(TRUE, oPC);
            AssignCommand(oNPC, ActionStartConversation(oPC, szConversationFile));
            SetCommandable(FALSE, oPC);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectCutsceneDominated(), oPC);
        }

}

void CutActionStartConversation(int nCutscene, float fDelay, object oNPC, object oPC, string szConversationFile, int iShift = TRUE)
{
        DelayCommand(fDelay, DelayCommand(GetShift(oPC, iShift), CallActionStartConversation(nCutscene, oNPC, oPC, szConversationFile)));
}

// Used for bubble text type speaking.
/* Example: CutSpeakString(0.0, GetObjectByTag("drow_priest"), "I like
   green eggs and ham."); would have the object drow_priest speak the
   line "I like green eggs and ham." after no delay.
*/
void CallSpeakString(int nCutscene, object oSpeaker, string szString)
{
    if (GetLocalInt(GetModule(), "nCut" + IntToString(nCutscene) + "Aborted") != 1)
    {
        if(GetIsPC(oSpeaker))
        {
            if(nCutscene == GetLocalInt(oSpeaker, "nCutsceneNumber"))
            {
                AssignCommand(oSpeaker, SpeakString(szString));
            }
        }
        else
        {
            AssignCommand(oSpeaker, SpeakString(szString));
        }
    }
}

void CallSpeakStringByStrRef(int nCutscene, object oSpeaker, int nStrRef)
{
    if (GetLocalInt(GetModule(), "nCut" + IntToString(nCutscene) + "Aborted") != 1)
    {
        if(GetIsPC(oSpeaker))
        {
            if(nCutscene == GetLocalInt(oSpeaker, "nCutsceneNumber"))
            {
                AssignCommand(oSpeaker, SpeakStringByStrRef(nStrRef));
            }
        }
        else
        {
            AssignCommand(oSpeaker, SpeakStringByStrRef(nStrRef));
        }
    }
}


void CutSpeakString(int nCutscene, float fDelay, object oSpeaker, string szString, int iShift = TRUE)
{
        DelayCommand(fDelay, DelayCommand(GetShift(oSpeaker, iShift), CallSpeakString(nCutscene, oSpeaker, szString)));
}

void CutSpeakStringByStrRef(int nCutscene, float fDelay, object oSpeaker, int nStrRef, int iShift = TRUE)
{
        DelayCommand(fDelay, DelayCommand(GetShift(oSpeaker, iShift), CallSpeakStringByStrRef(nCutscene, oSpeaker, nStrRef)));
}


// Used if you need a cutscene participant to do an animation.
/* Example: CutPlayAnimation(26.0, oPC, ANIMATION_FIREFORGET_BOW, 3.0);
   would have the PC bow for 3 seconds after a 26 second delay.
*/
void CallPlayAnimation(int nCutscene, object oObject, int nAnimation, float fLength)
{
    if (GetLocalInt(GetModule(), "nCut" + IntToString(nCutscene) + "Aborted") != 1)
    {
        if(GetIsPC(oObject))
        {
            if(nCutscene == GetLocalInt(oObject, "nCutsceneNumber"))
            {
                AssignCommand(oObject, PlayAnimation(nAnimation, 1.0, fLength));
            }
        }
        else
        {
            AssignCommand(oObject, PlayAnimation(nAnimation, 1.0, fLength));
        }
    }
}

void CutPlayAnimation(int nCutscene, float fDelay, object oObject, int nAnimation, float fLength, int iShift = TRUE)
{
        DelayCommand(fDelay, DelayCommand(GetShift(oObject, iShift), CallPlayAnimation(nCutscene, oObject, nAnimation, fLength)));
}

// Used to jump the PC to a location.
/* Example: CutJumpToLocation(20.0, oPC, GetLocation(GetWaypointByTag
   ("wp_jump")); would jump the PC to the wp_jump waypoint after a 20
   second delay.
*/
void CallJumpToLocation(int nCutscene, object oPC, location lLoc)
{
        if(!GetIsPC(oPC) || nCutscene == GetLocalInt(oPC, "nCutsceneNumber"))
        {
            if(GetCommandable(oPC) == FALSE)
            {
                SetCommandable(TRUE, oPC);
                AssignCommand(oPC, ActionJumpToLocation(lLoc));
                SetCommandable(FALSE, oPC);
            }
            else
                AssignCommand(oPC, ActionJumpToLocation(lLoc));
        }
}

void CutJumpToLocation(int nCutscene, float fDelay, object oPC, location lLoc, int iShift = TRUE)
{
        DelayCommand(fDelay, DelayCommand(GetShift(oPC, iShift), CallJumpToLocation(nCutscene, oPC, lLoc)));
}


// Used to jump the PC or NPC to an object.
/* Example: CutJumpToObject(20.0, oPC, GetObject(GetObjectByTag
   ("invis_object")); would jump the PC to the invis_object after a 20
   second delay.
*/
void CallJumpToObject(int nCutscene, object oPC, object oObject)
{
        if(!GetIsPC(oPC) || nCutscene == GetLocalInt(oPC, "nCutsceneNumber"))
        {
           if(GetCommandable(oPC) == FALSE)
           {
               SetCommandable(TRUE, oPC);
               AssignCommand(oPC, ActionJumpToObject(oObject));
               SetCommandable(FALSE, oPC);
           }
           else
               AssignCommand(oPC, ActionJumpToObject(oObject));

        }
}

void CutJumpToObject(int nCutscene, float fDelay, object oPC, object oObject, int iShift = TRUE)
{
        DelayCommand(fDelay, DelayCommand(GetShift(oPC, iShift), CallJumpToObject(nCutscene, oPC, oObject)));
}


// Used to move the PC or NPC to an object.
/* Example: CutActionMoveToObject(2.0, oPC, oTable, TRUE); would have the
   PC run to oTable after a 2 second delay. TRUE = run, FALSE = walk.
*/
void CallActionMoveToObject(int nCutscene, object oPC, object oTarget, int iRun)
{
        if(GetIsPC(oPC))
        {
            if(nCutscene == GetLocalInt(oPC, "nCutsceneNumber"))
            {
                if(GetCommandable(oPC) == FALSE)
                {
                    SetCommandable(TRUE);
                    AssignCommand(oPC, ActionMoveToObject(oTarget, iRun));
                    SetCommandable(FALSE);
                }
                else
                    AssignCommand(oPC, ActionMoveToObject(oTarget, iRun));
            }
        }
        else
        {
            if(GetCommandable(oPC) == FALSE)
            {
                SetCommandable(TRUE);
                AssignCommand(oPC, ActionMoveToObject(oTarget, iRun));
                SetCommandable(FALSE);
            }
            else
                AssignCommand(oPC, ActionMoveToObject(oTarget, iRun));
        }
}

void CutActionMoveToObject(int nCutscene, float fDelay, object oPC, object oTarget, int iRun, int iShift = TRUE)
{
        DelayCommand(fDelay, DelayCommand(GetShift(oPC, iShift), CallActionMoveToObject(nCutscene, oPC, oTarget, iRun)));
}


// Used to move the PC or NPC to a location.
/* Example: CutActionMoveToLocation(2.0, oPC, lTable, FALSE); would have the
   PC walk to lTable after a 2 second delay. TRUE = run, FALSE = walk.
*/
void CallActionMoveToLocation(int nCutscene, object oPC, location lLoc, int iRun)
{
        if(GetIsPC(oPC))
        {
            if(nCutscene == GetLocalInt(oPC, "nCutsceneNumber"))
            {
                if(GetCommandable(oPC) == FALSE)
                {
                    SetCommandable(TRUE);
                    AssignCommand(oPC, ActionMoveToLocation(lLoc, iRun));
                    SetCommandable(FALSE);
                }
                else
                    AssignCommand(oPC, ActionMoveToLocation(lLoc, iRun));
            }
        }
        else
        {
            if(GetCommandable(oPC) == FALSE)
            {
                SetCommandable(TRUE);
                AssignCommand(oPC, ActionMoveToLocation(lLoc, iRun));
                SetCommandable(FALSE);
            }
            else
                AssignCommand(oPC, ActionMoveToLocation(lLoc, iRun));
        }
}

void CutActionMoveToLocation(int nCutscene, float fDelay, object oPC, location lLoc, int iRun, int iShift = TRUE)
{
        DelayCommand(fDelay, DelayCommand(GetShift(oPC, iShift), CallActionMoveToLocation(nCutscene, oPC, lLoc, iRun)));
}


// Used to delay object create. Pass the type, the sTemplate, the location,
// and the effect you wish to have appear when the object is created
// (0 for no effect).  The PC is also passed to check cutscene abort.
/* EXAMPLE: CutCreateObject(2.3, oPC, OBJECT_TYPE_PLACEABLE, "resref", lLoc, VFX_FNF_HOLY_STRIKE);
   would create a placeable with the resref of "resref" at the location
   lLoc after 2.3 seconds, with the VFX_FNF_HOLY_STRIKE effect.
*/
void CallCreateObject(int nCutscene, int iType, object oPC, string sName, location lLoc, int iEffect)
{
    if (GetLocalInt(GetModule(), "nCut" + IntToString(nCutscene) + "Aborted") != 1)
    {
        if(nCutscene == GetLocalInt(oPC, "nCutsceneNumber"))
        {
             ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(iEffect), lLoc);
             CreateObject(iType, sName, lLoc);
        }
    }
}

void CutCreateObject(int nCutscene, float fDelay, object oPC, int iType, string sName, location lLoc, int iEffect, int iShift = TRUE)
{

        DelayCommand(fDelay, DelayCommand(GetShift(oPC, iShift), CallCreateObject(nCutscene, iType, oPC, sName, lLoc, iEffect)));
}


// Used to set the facing of a creature.
/* EXAMPLE CutSetFacingPoint(22.5, oPC, "creature_tag"); would
   have the PC face "creature_tag" object after a 22.5 second delay.
*/
void CallSetFacingPoint(int nCutscene, object oPC, string szTag)
{
    if(GetIsPC(oPC))
    {
        if(nCutscene == GetLocalInt(oPC, "nCutsceneNumber"))
        {
            AssignCommand(oPC, SetFacingPoint(GetPosition(GetObjectByTag(szTag))));
        }
    }
    else
        AssignCommand(oPC, SetFacingPoint(GetPosition(GetObjectByTag(szTag))));
}

void CutSetFacingPoint(int nCutscene, float fDelay, object oPC, string szTag, int iShift = TRUE)
{
        DelayCommand(fDelay, DelayCommand(GetShift(oPC, iShift), CallSetFacingPoint(nCutscene, oPC, szTag)));
}


// Used to fade out and back in, with a black screen section of
// 2 seconds in between.
/* EXAMPLE: CallFadeOutAndIn(35.0, oPC); would Fade the screen
   out and back in on the PC, after a delay of 35 seconds.
*/
void CallFadeOutAndIn(int nCutscene, object oObject)
{
    if(nCutscene == GetLocalInt(oObject, "nCutsceneNumber"))
    {
        FadeToBlack(oObject, FADE_SPEED_FASTEST);
        DelayCommand(2.3, BlackScreen(oObject));
        DelayCommand(4.0, FadeFromBlack(oObject, FADE_SPEED_FASTEST));
    }
}

void CutFadeOutAndIn(int nCutscene, float fDelay, object oObject, int iShift = TRUE)
{
        DelayCommand(fDelay, DelayCommand(GetShift(oObject, iShift), CallFadeOutAndIn(nCutscene, oObject)));
}


// Used to fade out.
/* EXAMPLE: CallFadeToBlack(35.0, oPC); would Fade the screen
   out on the PC, after a delay of 35 seconds.
*/
void CallFadeToBlack(int nCutscene, object oObject)
{
    if(nCutscene == GetLocalInt(oObject, "nCutsceneNumber"))
    {
        FadeToBlack(oObject);
    }
}

void CutFadeToBlack(int nCutscene, float fDelay, object oObject, int iShift = TRUE)
{
        DelayCommand(fDelay, DelayCommand(GetShift(oObject, iShift), CallFadeToBlack(nCutscene, oObject)));
}


// Used to fade in.
/* EXAMPLE: CallFadeFromBlack(35.0, oPC); would Fade the screen
   in on the PC, after a delay of 35 seconds.
*/
void CallFadeFromBlack(int nCutscene, object oObject)
{
    if(nCutscene == GetLocalInt(oObject, "nCutsceneNumber"))
    {
        FadeFromBlack(oObject);
    }
}

void CutFadeFromBlack(int nCutscene, float fDelay, object oObject, int iShift = TRUE)
{
        DelayCommand(fDelay, DelayCommand(GetShift(oObject, iShift), CallFadeFromBlack(nCutscene, oObject)));
}


// Used to set the camera for cutscene dramatics.
/* EXAMPLE: To set a camera with the following settings on the PC,
   after a 30.0 second delay:
   CAMERA_MODE_TOP_DOWN
   Facing = 170.0
   Zoom = 5.0
   Pitch = 50.0
   CAMERA_TRANSITION_TYPE_MEDIUM

   CutSetCamera(30.0, oPC, CAMERA_MODE_TOP_DOWN, 170.0, 5.0, 50.0,
                CAMERA_TRANSITION_TYPE_MEDIUM);
*/
void CallSetCamera(int nCutscene, object oObject, int iCameraType, float fFacing, float fZoom, float fPitch, int nSpeed)
{
     if(nCutscene == GetLocalInt(oObject, "nCutsceneNumber"))
     {
        SetCameraMode(oObject, iCameraType);
        AssignCommand(oObject, SetCameraFacing(fFacing, fZoom, fPitch, nSpeed));
     }
}

void CutSetCamera(int nCutscene, float fDelay, object oObject, int iCameraType, float fFacing, float fZoom, float fPitch, int nSpeed, int iShift = TRUE)
{
        DelayCommand(fDelay, DelayCommand(GetShift(oObject, iShift), CallSetCamera(nCutscene, oObject, iCameraType, fFacing, fZoom, fPitch, nSpeed)));
}


// Used to clear the actions of the subject.
/* EXAMPLE: CutClearAllActions(3.2, GetObjectByTag("guard"));
   would clear the actions of "guard" after a 3.2 second delay.
*/
void CallClearAllActions(int nCutscene, object oObject)
{
    if(GetIsPC(oObject))
    {
        if(nCutscene == GetLocalInt(oObject, "nCutsceneNumber"))
        {
            AssignCommand(oObject, ClearAllActions());
        }
    }
    else
        AssignCommand(oObject, ClearAllActions());


}

void CutClearAllActions(int nCutscene, float fDelay, object oObject, int iShift = TRUE)
{
        DelayCommand(fDelay, DelayCommand(GetShift(oObject, iShift), CallClearAllActions(nCutscene, oObject)));
}


// Used to apply a visual effect at a location. The PC is passed to
// determine if the cutscene has been aborted or not.
/* EXAMPLE: CutApplyEffectAtLocation(98.3, oPC, DURATION_TYPE_INSTANT,
                                     VXF_FNF_HOLY_STRIKE, lLoc, 0.0);
   would have a holy strike visual appear at lLoc after a 98.3 second delay.
   The duration is instant, lasting the default time.
*/
void CallApplyEffectAtLocation(int nCutscene, object oObject, int iDur, int iEffect, location lLoc, float fDur)
{
    if(GetIsPC(oObject))
    {
        if(nCutscene == GetLocalInt(oObject, "nCutsceneNumber"))
        {
            effect eEffect = EffectVisualEffect(iEffect);
            ApplyEffectAtLocation(iDur, eEffect, lLoc, fDur);
        }
    }
    else
    {
        effect eEffect1 = EffectVisualEffect(iEffect);
        ApplyEffectAtLocation(iDur, eEffect1, lLoc, fDur);
    }
}

void CutApplyEffectAtLocation(int nCutscene, float fDelay, object oObject, int iDur, int iEffect, location lLoc, float fDur = 0.0, int iShift = TRUE)
{
        DelayCommand(fDelay, DelayCommand(GetShift(oObject, iShift), CallApplyEffectAtLocation(nCutscene, oObject, iDur, iEffect, lLoc, fDur)));
}



// Used to apply a visual effect to an object.
/* EXAMPLE: CutApplyEffectToObject(98.3, oPC, DURATION_TYPE_TEMPORARY,
                                     VXF_DUR_PETRIFY, oPC, 4.0);
   would have a PETRIFY visual appear to the PC after a 98.3 second delay.
   The duration is temporary, lasting 4 seconds.
*/
void CallApplyEffectToObject(int nCutscene, int iDur, int iEffect, object oObject, float fDur)
{
    if (GetLocalInt(GetModule(), "nCut" + IntToString(nCutscene) + "Aborted") != 1)
    {
        if(GetIsPC(oObject))
        {
            if(nCutscene == GetLocalInt(oObject, "nCutsceneNumber"))
            {
                effect eEffect = EffectVisualEffect(iEffect);
                ApplyEffectToObject(iDur, eEffect, oObject, fDur);
            }
        }
        else
        {
            effect eEffect1 = EffectVisualEffect(iEffect);
            ApplyEffectToObject(iDur, eEffect1, oObject, fDur);
        }
    }
}

void CutApplyEffectToObject(int nCutscene, float fDelay, int iDur, int iEffect, object oObject, float fDur = 0.0, int iShift = TRUE)
{
        DelayCommand(fDelay, DelayCommand(GetShift(oObject, iShift), CallApplyEffectToObject(nCutscene, iDur, iEffect, oObject, fDur)));
}
//For all other effects (NOT VISUAL EFFECTS)
//Used to apply a NON visual effect to an object.
void CallApplyEffectToObject2(int nCutscene, int iDur, effect eEffect, object oObject, float fDur)
{
    if (GetLocalInt(GetModule(), "nCut" + IntToString(nCutscene) + "Aborted") != 1)
    {
        if(GetIsPC(oObject))
        {
            if(nCutscene == GetLocalInt(oObject, "nCutsceneNumber"))
            {
                ApplyEffectToObject(iDur, eEffect, oObject, fDur);
            }
        }
        else
        {
            ApplyEffectToObject(iDur, eEffect, oObject, fDur);

        }
    }
}

void CutApplyEffectToObject2(int nCutscene, float fDelay, int iDur, effect eEffect, object oObject, float fDur = 0.0, int iShift = TRUE)
{
        DelayCommand(fDelay, DelayCommand(GetShift(oObject, iShift), CallApplyEffectToObject2(nCutscene, iDur, eEffect, oObject, fDur)));
}

// Used to apply a knockdown effect to an object.
/* EXAMPLE: CutKnockdown(98.3, oPC, 4.0);
   would have a knockdown appear on the PC after a 98.3 second delay.
   The duration is always temporary, this one lasting 4 seconds.
*/
void CallKnockdown(int nCutscene, object oObject, float fDur)
{
    if(GetIsPC(oObject))
    {
        if(nCutscene == GetLocalInt(oObject, "nCutsceneNumber"))
        {
            effect eEffect = EffectKnockdown();
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEffect, oObject, fDur);
        }
    }
    else
    {
        effect eEffect = EffectKnockdown();
        int nTest = 0;
        if (GetPlotFlag(oObject) == TRUE)
        {
            nTest = 1;
            SetPlotFlag(oObject, FALSE);
        }
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eEffect, oObject, fDur);
        if (nTest == 1)
            SetPlotFlag(oObject, TRUE);
    }
}

void CutKnockdown(int nCutscene, float fDelay, object oObject, float fDur = 3.0, int iShift = TRUE)
{
        DelayCommand(fDelay, DelayCommand(GetShift(oObject, iShift), CallKnockdown(nCutscene, oObject, fDur)));
}


// Used to apply a death effect to an object.
/* EXAMPLE: CutDeath(98.3, oPC, TRUE);
   would have a death appear on the PC after a 98.3 second delay.
   The duration is always instant. TRUE is used if you want a
   spectacular death. Set FALSE otherwise.
*/
void CallDeath(int nCutscene, object oObject, int iSpec)
{
    if(GetIsPC(oObject))
    {
        if(nCutscene == GetLocalInt(oObject, "nCutsceneNumber"))
        {
            effect eEffect = EffectDeath(iSpec, TRUE);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eEffect, oObject);
        }
    }
    else
    {
        effect eEffect1 = EffectDeath(iSpec, TRUE);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eEffect1, oObject);
    }
}

void CutDeath(int nCutscene, float fDelay, object oObject, int iSpec = FALSE, int iShift = TRUE)
{
        DelayCommand(fDelay, DelayCommand(GetShift(oObject, iShift), CallDeath(nCutscene, oObject, iSpec)));
}


// Used to cast a fake spell at an object.
/* EXAMPLE: CutActionCastFakeSpellAtObject(23.0, oPC, SPELL_SUNBEAM, oTarget,
            PROJECTILE_PATH_TYPE_DEFAULT); would have the
            PC cast a sunbeam at the oTarget, with a default
            projectile path. This would happen after a 23
            second delay.
*/
void CallActionCastFakeSpellAtObject(int nCutscene, int iSpell, object oObject, object oTarget, int iPath)
{
    if(GetIsPC(oObject))
    {
        if(nCutscene == GetLocalInt(oObject, "nCutsceneNumber"))
        {
             AssignCommand(oObject, ActionCastFakeSpellAtObject(iSpell, oTarget, iPath));
        }
    }
    else
        AssignCommand(oObject, ActionCastFakeSpellAtObject(iSpell, oTarget, iPath));

}

void CutActionCastFakeSpellAtObject(int nCutscene, float fDelay, int iSpell, object oObject, object oTarget, int iPath, int iShift = TRUE)
{
        DelayCommand(fDelay, DelayCommand(GetShift(oObject, iShift), CallActionCastFakeSpellAtObject(nCutscene, iSpell, oObject, oTarget, iPath)));
}


// Used to cast a fake spell at a location.
/* EXAMPLE: CutActionCastFakeSpellAtLocation(23.0, oPC, SPELL_SUNBEAM, lLoc,
            PROJECTILE_PATH_TYPE_DEFAULT); would have the
            PC cast a sunbeam at lLoc, with a default
            projectile path. This would happen after a 23
            second delay.
*/
void CallActionCastFakeSpellAtLocation(int nCutscene, int iSpell, object oObject, location lLoc, int iPath)
{
    if(GetIsPC(oObject))
    {
        if(nCutscene == GetLocalInt(oObject, "nCutsceneNumber"))
        {
             AssignCommand(oObject, ActionCastFakeSpellAtLocation(iSpell, lLoc, iPath));
        }
    }
    else
        AssignCommand(oObject, ActionCastFakeSpellAtLocation(iSpell, lLoc, iPath));
}

void CutActionCastFakeSpellAtLocation(int nCutscene, float fDelay, int iSpell, object oObject, location lLoc, int iPath, int iShift = TRUE)
{
        DelayCommand(fDelay, DelayCommand(GetShift(oObject, iShift), CallActionCastFakeSpellAtLocation(nCutscene, iSpell, oObject, lLoc, iPath)));
}


// Used to set the PC's location so they can be jumped around as though
// they are the camera.
/* EXAMPLE: CutSetLocation(23.0, oPC); would set the location
   on the PC, as a variable, as a location to be returned to later. This
   would happen after a 23 second delay.
*/
void CallSetLocation(int nCutscene, object oPC)
{
    if(GetIsPC(oPC))
    {
        if(nCutscene == GetLocalInt(oPC, "nCutsceneNumber"))
        {
             SetLocalLocation(oPC, "cut_jump_location", GetLocation(oPC));
        }
    }
    else
        SetLocalLocation(oPC, "cut_jump_location", GetLocation(oPC));
}

void CutSetLocation(int nCutscene, float fDelay, object oPC, int iShift = TRUE)
{
        DelayCommand(fDelay, DelayCommand(GetShift(oPC, iShift), CallSetLocation(nCutscene, oPC)));
}


// Used to recall the PC's location so they can be jumped back to their
// original location, stored by CutGetLocation.
/* EXAMPLE: CutRestoreLocation(23.0, oPC); would return the PC
   to their original spot. This would happen after a 23 second delay.
*/
void CallRestoreLocation(int nCutscene, object oPC)
{
    if(GetIsPC(oPC))
    {
        if(nCutscene == GetLocalInt(oPC, "nCutsceneNumber"))
        {
           location lLoc = GetLocalLocation(oPC, "cut_jump_location");
           if(GetCommandable(oPC) == FALSE)
           {
               SetCommandable(TRUE, oPC);
               AssignCommand(oPC, JumpToLocation(lLoc));
               DelayCommand(0.2, SetCommandable(FALSE, oPC));
           }
           else
               AssignCommand(oPC, JumpToLocation(lLoc));
        }
    }
    else
    {
        location lLoc1 = GetLocalLocation(oPC, "cut_jump_location");
        if(GetCommandable(oPC) == FALSE)
        {
            SetCommandable(TRUE, oPC);
            AssignCommand(oPC, JumpToLocation(lLoc1));
            DelayCommand(0.2, SetCommandable(FALSE, oPC));
        }
        else
            AssignCommand(oPC, JumpToLocation(lLoc1));
    }
}

void CutRestoreLocation(int nCutscene, float fDelay, object oPC, int iShift = TRUE)
{
        DelayCommand(fDelay, DelayCommand(GetShift(oPC, iShift), CallRestoreLocation(nCutscene, oPC)));
}


// Used to turn cutscene mode on or off.
/* EXAMPLE: CutSetCutsceneMode(10.0, oPC, TRUE); would turn cutscene mode
   on after 10 seconds for the PC.
*/
void CallSetCutsceneMode(int nCutscene, object oPC, int iValue, int bKeepAssociate = FALSE)
{
        if(nCutscene == GetLocalInt(oPC, "nCutsceneNumber"))
        {
             if(iValue == FALSE)
             {
                  SetCutsceneMode(oPC, iValue);
                  SetCommandable(TRUE, oPC);
             }
             else
             {
                  SetCutsceneMode(oPC, iValue);
                  // Destroy associates.
                  if (bKeepAssociate == FALSE)
                  {
                      if(GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPC) != OBJECT_INVALID)
                         DestroyObject(GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPC));
                      if(GetAssociate(ASSOCIATE_TYPE_DOMINATED, oPC) != OBJECT_INVALID)
                         DestroyObject(GetAssociate(ASSOCIATE_TYPE_DOMINATED, oPC));
                      if(GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPC) != OBJECT_INVALID)
                         DestroyObject(GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPC));
                      if(GetAssociate(ASSOCIATE_TYPE_SUMMONED, oPC) != OBJECT_INVALID)
                         DestroyObject(GetAssociate(ASSOCIATE_TYPE_SUMMONED, oPC));
                  }
             }
        }
}

void CutSetCutsceneMode(int nCutscene, float fDelay, object oPC, int iValue, int iShift = TRUE, int bKeepAssociate = FALSE)
{
        DelayCommand(fDelay, DelayCommand(GetShift(oPC, iShift), CallSetCutsceneMode(nCutscene, oPC, iValue, bKeepAssociate)));
}

// Used to turn plot flags on or off.
/* EXAMPLE: CutSetPlotFlag(10.0, oObject, 1); would turn plot flag to
   on after 10 seconds for the object.
*/
void CallSetPlotFlag(int nCutscene, object oObject, int iValue)
{
        if(nCutscene == GetLocalInt(oObject, "nCutsceneNumber"))
        {

             SetPlotFlag(oObject, iValue);

        }
}

void CutSetPlotFlag(int nCutscene, float fDelay, object oObject, int iValue, int iShift = TRUE)
{
        DelayCommand(fDelay, DelayCommand(GetShift(oObject, iShift), CallSetPlotFlag(nCutscene, oObject, iValue)));
}

// Used to destroy objects. Make sure they are destroyable first with the
// CutSetPlotFlag function.
/* EXAMPLE: CutDestroyObject(10.0, oObject); would destroy the object
   after 10 seconds.
*/
void CallDestroyObject(int nCutscene, object oObject)
{
        if(nCutscene == GetLocalInt(oObject, "nCutsceneNumber"))
        {

             DestroyObject(oObject);

        }
}

void CutDestroyObject(int nCutscene, float fDelay, object oObject, int iShift = TRUE)
{
        DelayCommand(fDelay, DelayCommand(GetShift(oObject, iShift), CallDestroyObject(nCutscene, oObject)));
}

// Used to store the camera position.
/* EXAMPLE: CutStoreCameraFacing(10.0, oPC); would set the current
   camera settings at the 10.0 mark.
*/
void CallStoreCameraFacing(int nCutscene, object oPC)
{
        if(nCutscene == GetLocalInt(oPC, "nCutsceneNumber"))
        {

             StoreCameraFacing();

        }
}

void CutStoreCameraFacing(int nCutscene, float fDelay, object oPC, int iShift = TRUE)
{
        DelayCommand(fDelay, DelayCommand(GetShift(oPC, iShift), CallStoreCameraFacing(nCutscene, oPC)));
}

// Used to restore the camera position.
/* EXAMPLE: CutRestoreCameraFacing(10.0, oPC); would set the old
   camera settings back at the 10.0 mark.
*/
void CallRestoreCameraFacing(int nCutscene, object oPC)
{
        if(nCutscene == GetLocalInt(oPC, "nCutsceneNumber"))
        {

             RestoreCameraFacing();

        }
}

void CutRestoreCameraFacing(int nCutscene, float fDelay, object oPC, int iShift = TRUE)
{
        DelayCommand(fDelay, DelayCommand(GetShift(oPC, iShift), CallRestoreCameraFacing(nCutscene, oPC)));
}

// Used to set the screen to black.  This is very useful in covering up
// and cutscene jumps that happen in the same area as the play area.
/* EXAMPLE: CutBlackScreen(10.0, oPC); would set the screen to black
   at the 10.0 mark.
*/
void CallBlackScreen(int nCutscene, object oPC)
{
        if(nCutscene == GetLocalInt(oPC, "nCutsceneNumber"))
        {

             BlackScreen(oPC);

        }
}

void CutBlackScreen(int nCutscene, float fDelay, object oPC, int iShift = TRUE)
{
        DelayCommand(fDelay, DelayCommand(GetShift(oPC, iShift), CallBlackScreen(nCutscene, oPC)));
}

// Used to remove the screen to black.
/* EXAMPLE: CutStopFade(10.0, oPC); would set the screen back from black
   at the 10.0 mark.
*/
void CallStopFade(int nCutscene, object oPC)
{
        if(nCutscene == GetLocalInt(oPC, "nCutsceneNumber"))
        {

             StopFade(oPC);

        }
}

void CutStopFade(int nCutscene, float fDelay, object oPC, int iShift = TRUE)
{
        DelayCommand(fDelay, DelayCommand(GetShift(oPC, iShift), CallStopFade(nCutscene, oPC)));
}

void CallPlaySound(int nCutscene, object oPC, string szSound)
{
    if(nCutscene == GetLocalInt(oPC, "nCutsceneNumber"))
    {
        AssignCommand(oPC, PlaySound(szSound));
    }
}

void CutPlaySound(int nCutscene, float fDelay, object oPC, string szSound, int iShift = TRUE)
{
    DelayCommand(fDelay, DelayCommand(GetShift(oPC, iShift), CallPlaySound(nCutscene, oPC, szSound)));

}

void RemoveAssociateEffects(object oCreature)
{
    effect eEff1 = GetFirstEffect(oCreature);
    while(GetIsEffectValid(eEff1))
    {
        if (GetEffectType(eEff1) == EFFECT_TYPE_CUTSCENE_PARALYZE)
        {
            RemoveEffect(oCreature, eEff1);
        }
        eEff1 = GetNextEffect(oCreature);
    }
}

object FreezeAssociate(object oPlayers)
{
    effect eAssociate = EffectCutsceneParalyze();
    //Cutscene Paralize any associates.
    object oHench = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oPlayers);
    if (oHench != OBJECT_INVALID)
    {
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eAssociate, oHench);

    }
    object oCompanion = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPlayers);
    if (oCompanion != OBJECT_INVALID)
    {
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eAssociate, oCompanion);

    }
    object oFamiliar = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPlayers);
    if (oFamiliar != OBJECT_INVALID)
    {
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eAssociate, oFamiliar);

    }
    object oSummon = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oPlayers);
    if (oSummon != OBJECT_INVALID)
    {
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eAssociate, oSummon);

    }
    object oDominated = GetAssociate(ASSOCIATE_TYPE_DOMINATED, oPlayers);
    if (oDominated != OBJECT_INVALID)
    {
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, eAssociate, oDominated);

    }
    return oDominated;
}
void UnFreezeAssociate(object oPlayers)
{

 //Cutscene Paralize any associates.
        object oHench = GetAssociate(ASSOCIATE_TYPE_HENCHMAN, oPlayers);
        if (oHench != OBJECT_INVALID)
        {
            RemoveAssociateEffects(oHench);

        }
        object oCompanion = GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPlayers);
        if (oCompanion != OBJECT_INVALID)
        {
            RemoveAssociateEffects(oCompanion);

        }
        object oFamiliar = GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPlayers);
        if (oFamiliar != OBJECT_INVALID)
        {
            RemoveAssociateEffects(oFamiliar);

        }
        object oSummon = GetAssociate(ASSOCIATE_TYPE_SUMMONED, oPlayers);
        if (oSummon != OBJECT_INVALID)
        {
            RemoveAssociateEffects(oSummon);

        }
        object oDominated = GetLocalObject(oPlayers, "oDominated");
        if (oDominated != OBJECT_INVALID)
        {
            RemoveAssociateEffects(oDominated);
        }
}

