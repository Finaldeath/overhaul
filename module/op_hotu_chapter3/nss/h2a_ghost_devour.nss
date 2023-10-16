//::///////////////////////////////////////////////
//:: Generic Spirit of the Dead, Devour Soul (Action Script)
//:: H2a_Ghost_Devour.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
     Small chance that the NPC's soul will be
     devoured while in conversation.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: August 5, 2003
//:://////////////////////////////////////////////

void main()
{
    //6% chance that the ghost's soul will be devoured.
    int iGender = GetGender(OBJECT_SELF);
    string sSound;

    if(iGender == GENDER_MALE)
    {
        sSound = "vs_nclerkm1_dead";
    }
    else
    {
        sSound = "vs_ncomolf1_dead";
    }

    int iDevour = Random(100)+1;
/*DEBUG*///SendMessageToPC(GetPCSpeaker(), "[NOT IN STRING EDITOR] nDevour == "+IntToString(iDevour));
    if (iDevour < 6)
    {
        effect eVFX = EffectVisualEffect(VFX_IMP_DEATH);
        location lLoc = GetLocation(OBJECT_SELF);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVFX, lLoc);
        AssignCommand(GetNearestCreature(CREATURE_TYPE_IS_ALIVE, TRUE), PlaySound(sSound));
        DestroyObject(OBJECT_SELF, 0.2);
    }
}
