//::///////////////////////////////////////////////
//:: Name  act_movetouml1
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Jump the PC who is using the well down into
    Undermountain.
    Set a variable on him so that durnan will
    speak correctly when the PC returns to the inn.
*/
//:://////////////////////////////////////////////
//:: Created By:  Keith Warner
//:: Created On:  Jan 30/03
//:://////////////////////////////////////////////

void main()
{


    object oPC = GetPCSpeaker();
    //Set Local so that UM1 area will know where the PC came from
    SetLocalInt(oPC, "X2_MovedFromYPWell", 1);
    //Fade PC to black and play winching sound
 //   FadeToBlack(oPC);
    DelayCommand(0.5, PlaySound("as_cv_crank1"));
    object oMoveToRope = GetObjectByTag("q2b01pullrope");

    //Set and int that this PC has now been to Undermountain
    SetLocalInt(oPC, "nBeenToDungeon", 1);


    // * close well door
    //object oWell = GetNearestObjectByTag("welldoor");
    //object oWellLever = GetNearestObjectByTag("welllever");
    //AssignCommand(oWellLever,ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE));
    //AssignCommand(oWell, ActionCloseDoor(oWell));



    //Jump PC to Undermountain
    DelayCommand(2.2, AssignCommand (oPC,ActionJumpToObject(oMoveToRope,0)));
}
