//::///////////////////////////////////////////////
//:: Name  act_q1rumgut_1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
Place PC in cage with Becka.
PC wakes up and speaks to Becka, at the end, finding
a secret passage out, that leads to a tunnel with
some weaker monsters to kill, and then back out into the foothills.
*/
//:://////////////////////////////////////////////
//:: Created By: Keith Warner
//:: Created On: Mar 5/03
//:://////////////////////////////////////////////

void main()
{
        //Integer for conversation
    object oPC = GetPCSpeaker();
    SetLocalInt(oPC, "X1_Q1RUMGUTCAPTUREPC", 1);


    object wpPC = GetWaypointByTag("wp_q1rumgut_pchostage");
    object wpHench = GetWaypointByTag("wp_q1rumgut_pchench");

    FadeToBlack(oPC);
    DelayCommand(2.0, BlackScreen(oPC));

    //Destroy the key on the PC - if he has one
    object oKey = GetItemPossessedBy(oPC, "q1rumgutkey");
    if (GetIsObjectValid(oKey) == TRUE)
        DestroyObject(oKey);
    //Get rebecca to start conversation with the PC
    object oRebecca = GetObjectByTag("q1ruralrebecca");
    SetLocalInt(oRebecca, "X1_BECKACAGE",10);
    DelayCommand(2.8, AssignCommand(oPC, ActionJumpToObject(wpPC)));
    DelayCommand(4.0, FadeFromBlack(oPC));
    DelayCommand(6.0, AssignCommand(oRebecca, ActionStartConversation(oPC)));
    object oHenchman = GetHenchman(oPC);

    if (oHenchman != OBJECT_INVALID)
    {

        //Jump henchman into cage with PC
        DelayCommand(3.4, AssignCommand(oHenchman, JumpToObject(wpHench)));
    }
    // Destroy associates.
    if(GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPC) != OBJECT_INVALID)
        DestroyObject(GetAssociate(ASSOCIATE_TYPE_ANIMALCOMPANION, oPC), 2.0);
    if(GetAssociate(ASSOCIATE_TYPE_DOMINATED, oPC) != OBJECT_INVALID)
        DestroyObject(GetAssociate(ASSOCIATE_TYPE_DOMINATED, oPC), 2.0);
    if(GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPC) != OBJECT_INVALID)
        DestroyObject(GetAssociate(ASSOCIATE_TYPE_FAMILIAR, oPC), 2.0);
    if(GetAssociate(ASSOCIATE_TYPE_SUMMONED, oPC) != OBJECT_INVALID)
        DestroyObject(GetAssociate(ASSOCIATE_TYPE_SUMMONED, oPC), 2.0);


}
