//::///////////////////////////////////////////////
//:: Die Roll: 6d10
//:: DieRoll_G_6d10.nss
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Creates a 6d10 broadcast string.
*/
//:://////////////////////////////////////////////
//:: Created By: Rob Bartel
//:: Created On: July 24, 2002
//:://////////////////////////////////////////////

void main()
{
    //Figure out who rolled the dice
    object oRoller = GetPCSpeaker();
    string sName = GetName(oRoller);

    //Roll the dice and tally them up
    int i1d10 = Random(10)+1;
    int i2d10 = Random(10)+1;
    int i3d10 = Random(10)+1;
    int i4d10 = Random(10)+1;
    int i5d10 = Random(10)+1;
    int i6d10 = Random(10)+1;
    int iTotal = i1d10 + i2d10 + i3d10 + i4d10 + i5d10 + i6d10;

    //Convert the rolls and totals to strings
    string s1d10 = IntToString(i1d10);
    string s2d10 = IntToString(i2d10);
    string s3d10 = IntToString(i3d10);
    string s4d10 = IntToString(i4d10);
    string s5d10 = IntToString(i5d10);
    string s6d10 = IntToString(i6d10);
    string sTotal = IntToString(iTotal);

    //Compile the string to be broadcast and save it out as a local
    string sBroadcast = sName+" rolls 6d10 ("+s1d10+", "+s2d10+", "+s3d10+", "+s4d10+", "+s5d10+", "+s6d10+"): TOTAL = "+sTotal+".";
    SetLocalString(oRoller, "DiceBagBroadcast", sBroadcast);
}
