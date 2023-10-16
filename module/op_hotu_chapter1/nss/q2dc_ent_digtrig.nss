//::///////////////////////////////////////////////
//:: Name  q2dc_ent_digtrig
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Formian digger will appear if the Queen has
    spoken to the PC - Digger will start a conversation
    that can lead PCs through the formian 'secret door'
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  June 27/03
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(OBJECT_SELF, "nTriggered") == 1)
        return;

    object oPC = GetEnteringObject();
    if (GetIsPC(oPC) == FALSE)
        return;

    if (GetLocalInt(GetModule(), "X2_Q2DFormiansHelp") == 2)
    {
        SetLocalInt(OBJECT_SELF, "nTriggered", 1);

        location lSpawnPoint = GetLocation(GetWaypointByTag("wp_q2dc_formiandigger"));
        effect eRocks = EffectVisualEffect(137); //rocks up effect
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eRocks, lSpawnPoint);
        object oDigger = CreateObject(OBJECT_TYPE_CREATURE, "q2d_formdigger", lSpawnPoint);
        AssignCommand(oDigger, ActionStartConversation(oPC));
    }
}
