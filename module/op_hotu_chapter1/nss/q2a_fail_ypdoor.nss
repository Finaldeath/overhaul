//::///////////////////////////////////////////////
//:: NW_OD_FEEDBACK7.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
  Displays the standard response to a plot door
  being unable to be opened.
*/
//:://////////////////////////////////////////////
//:: Created By:  Brent
//:: Created On:
//:://////////////////////////////////////////////

void main()
{

    //object oGrayban = GetObjectByTag("q2a_grayban");
    //if (GetLocalInt(GetModule(), "X2_ypattack") < 4)
    //{
    //    if (GetDistanceToObject(oGrayban) < 25.0)
    //    {
            //AssignCommand(oGrayban, ActionStartConversation(GetEnteringObject()));
    //        BeginConversation("q2agrayban");
    //    }
    //    else
    //    {
            SetLocalInt(OBJECT_SELF, "NW_L_FEEDBACK",8) ;
            SpeakOneLinerConversation();
            ActionDoCommand(SetLocalInt(OBJECT_SELF, "NW_L_FEEDBACK",0));
    //    }
    //}
   // else
    //{
    //    if (GetDistanceToObject(oGrayban) < 25.0)
    //    {
    //        AssignCommand(oGrayban, ActionStartConversation(GetEnteringObject()));
    //      //BeginConversation("q2agrayban");
    //    }

    //}

}
