//::///////////////////////////////////////////////
//:: Name q2b_dam_garg
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
      On damage - if another gargoyle caused the damage,
      then all gargoyles will be destroyed.
*/
//:://////////////////////////////////////////////
//:: Created By:Keith Warner
//:: Created On: Nov 9/02
//:://////////////////////////////////////////////
void OpenDoor();

void main()
{
    object oGarg1 = GetObjectByTag("q2b_garg_1");
    object oGarg2 = GetObjectByTag("q2b_garg_2");
    object oGarg3 = GetObjectByTag("q2b_garg_3");

    object oDamager = GetLastDamager();
    //if any other gargoyle caused the damage
    if (GetTag(oDamager) == GetTag(oGarg1) || GetTag(oDamager) == GetTag(oGarg2) || GetTag(oDamager) == GetTag(oGarg3))
    {   //but can't damage itself
        if (oDamager != OBJECT_SELF)
        {
                //Destroy all 3 gargoyles and open the door
                effect eDamage = EffectDamage(500);
                OpenDoor();
                DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, GetObjectByTag("q2b_garg_1")));
                DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, GetObjectByTag("q2b_garg_2")));
                DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, GetObjectByTag("q2b_garg_3")));
                OpenDoor();
        }
    }
}

void OpenDoor()
{
    //Unlock and open the door to the sleeping dwarves
    //Have the door say its one liner
    //Stop the trap countdown lights
    object oDoor = GetObjectByTag("q2b06_door");
    SetLocked(oDoor, FALSE);
    SetLocalInt(oDoor, "nDoorBlocked",2);
    AssignCommand(oDoor,SpeakOneLinerConversation());
    AssignCommand(oDoor, ActionOpenDoor(oDoor));
    SetLocalInt(GetModule(),"nQ2BGARGTRAPACTIVE", 0);
}
