#include "MQ3TRIAL"


//// Merc 1 Testimony, Check if PC is Good, Chaotic, Female, Druid/Ranger

void main()



{
//////// TEST STUFF - SET UP INFO VARIABLES FOR TRIAL TEST

////    SetLocalInt (GetModule(), "NW_G_M1Q00PLOTSPIKED", 99) ;
////    SetLocalInt (GetModule(), "NW_G_M1Q00PLOTVIOLENT", 99)  ;
////    SetLocalInt (GetModule(), "NW_G_M1Q00PLOTCHEAT", 99)   ;




     ////Give starting values to everyone.
     ApplyFactor(1);
     
     /////Check for Bribe to Juror 1 (if true case 33)
        if (GetLocalInt(GetModule(), "NW_G_M1Q00PLOTBRIBEJUROR1")==1)
        ApplyFactor(33);
     ///// Check for bribe to Juror 2 (if true case 34)
       if (GetLocalInt(GetModule(), "NW_G_M1Q00PLOTBRIBEJUROR2")==1)
        ApplyFactor(34);
     /////  Check for bribe to Juror 4 (if true case 35)
         if (GetLocalInt(GetModule(), "NW_G_M1Q00PLOTBRIBEJUROR4")==1)
        ApplyFactor(35);

     /// Check for Good
     if (GetAlignmentGoodEvil(GetPCSpeaker())==ALIGNMENT_GOOD)
        ApplyFactor(2);

     //// Check for Chaos
     if (GetAlignmentLawChaos(GetPCSpeaker())==ALIGNMENT_CHAOTIC)
        ApplyFactor(3);

     /// Check for Female
     if (GetGender(GetPCSpeaker())==GENDER_FEMALE)
        ApplyFactor(4);

     /// Check for nature class
     if (GetLevelByClass(CLASS_TYPE_DRUID, GetPCSpeaker()) + GetLevelByClass(CLASS_TYPE_RANGER, GetPCSpeaker())>=1)
        ApplyFactor(5);


    ApplyFactor(6);

}

