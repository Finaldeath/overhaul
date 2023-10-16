//::///////////////////////////////////////////////
//:: Name  act_q1aayala_tp2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Ayala will teleport the PC and companions back
    to their party leader ('Mystra's Hand')
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Feb 7/03
//:://////////////////////////////////////////////

void main()
{
    //the teleportee
    object oPC = GetPCSpeaker();

    object oLeader = GetFactionLeader(GetPCSpeaker());
    if (GetIsObjectValid(oLeader) == TRUE)
    {

        //location to teleport to
        location lTport = GetLocation(oLeader);
        //teleport effect
        effect ePoof = EffectVisualEffect(VFX_IMP_HEALING_G);

        //PC's current location
        vector vUser = GetPosition(oPC);
        vUser = Vector(vUser.x, vUser.y, vUser.z + 1.0);
        location lUser1 = Location(GetArea(oPC), vUser, 0.0);

        //Target location
        vector vTarget = GetPosition(oLeader);
        vTarget = Vector(vTarget.x, vTarget.y, vTarget.z + 1.0);
        location lTarget1 = Location(GetArea(oLeader), vTarget, 0.0);

        //Have Ayala cast spell on PC
        ActionCastFakeSpellAtObject(SPELL_GREATER_SPELL_BREACH, oPC);

        //Apply teleport effect at current location
        DelayCommand(1.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, ePoof, GetLocation(oPC)));
        DelayCommand(1.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, ePoof, lUser1));

        //DON'T APPLY EFFECTS AT TARGET LOCATION BECAUSE YOU DON'T HAVE EXACT POSITION THAT PC APPEARS AT
        //Apply teleport effect at target location
        //DelayCommand(3.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, ePoof, lTport));
        //DelayCommand(3.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, ePoof, lTarget1));

        // Teleport back to Drogan's house
        DelayCommand(2.5, AssignCommand(oPC, ActionJumpToLocation(lTport)));
    }
}
