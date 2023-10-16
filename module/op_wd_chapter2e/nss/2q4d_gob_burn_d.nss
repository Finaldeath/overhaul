//::///////////////////////////////////////////////
//:: Goblin Reveller Custom User Defined Event
//:: 2Q4D_GOB_BURN
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Makes the goblins walk around burn books
    and generally act like goofs.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Feb 15, 2002
//:://////////////////////////////////////////////
#include "NW_I0_HOSTINCL"
#include "NW_I0_GENERIC"
void main()
{
    int nUser = GetUserDefinedEventNumber();
    if(nUser == 1001) //HEARTBEAT
    {
        if(!IsInConversation(OBJECT_SELF) && !GetIsFighting(OBJECT_SELF))
        {
            int nGlobal = GetLocalInt(GetArea(OBJECT_SELF), "NW_2Q4_START_BURNING");

            if(nGlobal == 1)
            {
                object oStoredBook = GetLocalObject(OBJECT_SELF, "2Q4_BOOK_TARGET");
                int nLocal = GetLocalPlotIntFromCharacter(OBJECT_SELF);
                if(nLocal == 0 || !GetIsObjectValid(oStoredBook))
                {
                    ClearAllActions();
                    SetLocalPlotIntOnCharacter(OBJECT_SELF, 1);
                    object oBook = GetNearestObjectByTag("2Q4_BurnedBooks");
                    if(GetIsObjectValid(oBook))
                    {
                        SetLocalObject(OBJECT_SELF, "2Q4_BOOK_TARGET", oBook);
                        ActionMoveToObject(oBook, FALSE, 0.50);
                        vector vFace = GetPosition(oBook);
                        ActionDoCommand(SetFacingPoint(vFace));
                        ActionPlayAnimation(ANIMATION_LOOPING_GET_LOW, 1.0, 2.0);
                        effect eVis = EffectVisualEffect(VFX_IMP_FLAME_M);
                        ActionDoCommand(ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVis, GetLocation(oBook)));
                        ActionDoCommand(DestroyObject(oBook, 0.45));
                        ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY1);
                        ActionDoCommand(PlayVoiceChat(VOICE_CHAT_CHEER));
                        ActionDoCommand(SetLocalPlotIntOnCharacter(OBJECT_SELF, 0));
                    }
                }
            }
        }
    }
}

