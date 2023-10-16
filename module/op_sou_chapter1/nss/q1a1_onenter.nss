//::///////////////////////////////////////////////
//:: Name q1a1_onenter
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
 When the PC enters Drogan's home with the Tower Statue, the following should occur:

- fade to black
- Drogan stands up (he's recovered)
- the "Drogan_Healed" variable on the module gets set to 2
- move all PC's into conversation range of Drogan and Ayala
- Drogan inits dialogue with the PC that has the Tower
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Mar 11/03
//:://////////////////////////////////////////////

void main()
{
    object oPC = GetEnteringObject();

    if (GetIsPC(oPC) == FALSE)
        return;
    object oHench = GetHenchman(oPC);

    //if one or the other has the tower statue
    if (GetIsObjectValid(GetItemPossessedBy(oHench, "x1tower")) == TRUE || GetIsObjectValid(GetItemPossessedBy(oPC, "x1tower")) == TRUE)
    {
        BlackScreen(oPC);
        FadeFromBlack(oPC, FADE_SPEED_FAST);
        object oAyala = GetObjectByTag("Ayala");
        object oDrogan = GetObjectByTag("Drogan");
        object oDialog = GetObjectByTag("q1a1_drogancon");

        //Destroy Drogan's dialog object
        DestroyObject(oDialog);
        //Heal Drogan
        effect eHeal = EffectHeal(100);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eHeal, oDrogan);
        SetCommandable(TRUE, oDrogan);
        AssignCommand(oDrogan, PlayAnimation(ANIMATION_LOOPING_PAUSE_DRUNK,1.0, 1.5));

        AssignCommand(oAyala, ActionMoveToObject(oPC, FALSE, 3.0));

        SetLocalInt(GetModule(), "Drogan_Healed", 2);

        DelayCommand(1.5, AssignCommand(oDrogan, ActionStartConversation(oPC)));
    }


}
