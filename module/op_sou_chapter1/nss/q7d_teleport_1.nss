//::///////////////////////////////////////////////
//:: Name q7d_teleport_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Take 500 gp from the PC and teleport them outside
    the Community Hall in Hilltop
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: April 16/03
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetPCSpeaker();
    if (GetGold(oPC) >= 500)
    {
        //Take gold from the PC
        TakeGoldFromCreature(500, oPC);
        //location to teleport to
        location lTport = GetLocation(GetWaypointByTag("wp_q7teleport_hilltop"));
        //teleport effect
        effect ePoof = EffectVisualEffect(VFX_IMP_HEALING_G);

        //PC's current location
        vector vUser = GetPosition(oPC);
        vUser = Vector(vUser.x, vUser.y, vUser.z + 1.0);
        location lUser1 = Location(GetArea(oPC), vUser, 0.0);

        //Target location
        vector vTarget = GetPositionFromLocation(lTport);
        vTarget = Vector(vTarget.x, vTarget.y, vTarget.z + 1.0);
        location lTarget1 = Location(GetAreaFromLocation(lTport), vTarget, 0.0);

        //Have Hermit cast spell on PC
        ActionCastFakeSpellAtObject(SPELL_GREATER_SPELL_BREACH, oPC);

        //Apply teleport effect at current location
        DelayCommand(1.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, ePoof, GetLocation(oPC)));
        DelayCommand(1.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, ePoof, lUser1));

        //Apply teleport effect at target location
        DelayCommand(3.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, ePoof, lTport));
        DelayCommand(3.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, ePoof, lTarget1));

        // Teleport back to Drogan's house
        DelayCommand(2.5, AssignCommand(oPC, JumpToLocation(lTport)));
    }
}
