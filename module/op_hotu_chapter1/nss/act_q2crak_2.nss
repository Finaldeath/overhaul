//::///////////////////////////////////////////////
//:: Name act_q2crak_2
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Create the Djinn in front of the players..
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: July 21/03
//:://////////////////////////////////////////////

void main()
{
    //Create Djinn in front of player
    object oDjinn = CreateObject(OBJECT_TYPE_CREATURE, "x2_djinn", GetLocation(GetItemActivator()), TRUE);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), GetLocation(oDjinn));
    AssignCommand(oDjinn, SetFacingPoint(GetPosition(GetItemActivator())));


}
