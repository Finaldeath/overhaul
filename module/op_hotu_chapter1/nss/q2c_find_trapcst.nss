//::///////////////////////////////////////////////
//:: Name: q2c_find_trapcst
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Those who succeed in a Spellcraft check will
    notice the illusionary magic on the trapped
    chests.
*/
//:://////////////////////////////////////////////
//:: Created By:Keith Warner
//:: Created On:Dec 10/02
//:://////////////////////////////////////////////

void main()
{
    if (GetLocalInt(OBJECT_SELF, "nTriggered") == 1)
        return;

    if (GetHasSkill(SKILL_SPELLCRAFT, GetEnteringObject()) == TRUE)
    {
        object oMessage = GetObjectByTag("q2c_trig_trapchest");
        AssignCommand(oMessage, SpeakOneLinerConversation());
        SetLocalInt(OBJECT_SELF, "nTriggered", 1);
    }
}
