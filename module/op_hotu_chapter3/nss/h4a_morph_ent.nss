//::///////////////////////////////////////////////
//:: Name h4a_morph_ent
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     This will check that the PC is in the right
     form to enter the wolf den.
*/
//:://////////////////////////////////////////////
//:: Created By: Brad Prince
//:: Created On: Aug 21, 2003
//:://////////////////////////////////////////////
#include "hx_inc_appear"
void main()
{
    object oPC = GetEnteringObject();
    int iAppearance = GetAppearanceType(oPC);
    object oBlock = GetObjectByTag("hx_wolf_block");
    object oStorage = GetObjectByTag("hx_wolf_den_storage");

    if(GetIsPC(oPC))
    {
        if(CheckWolf(oPC))
        {
            SetLocalLocation(oStorage, "HX_WOLF_BLOCK", GetLocation(oBlock));
            DestroyObject(oBlock);
        }
        else
        {
            if(!GetIsObjectValid(oBlock))
            {
                CreateObject(OBJECT_TYPE_PLACEABLE, "hx_wolf_block", GetLocalLocation(oStorage, "HX_WOLF_BLOCK"));
            }
            AssignCommand(oPC, ClearAllActions(TRUE));
            AssignCommand(GetObjectByTag("hx_wolf_speaker"), ActionStartConversation(oPC));
        }
    }
}
