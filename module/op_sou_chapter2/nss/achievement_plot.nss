///////////////////////////////////////////////////
// Modified by Bill Harper
// May 22, 2020
//////////////////////////////////////////////////

#include "achievement_lib"

void main()
{
    object oPC = GetPCSpeaker();
    object oModule = GetModule();
    string sModule = GetTag(oModule);


    if(sModule == "Prelude"){
        PlotAchievement(oPC, 0);
    }
    if(sModule == "ENDMODULE1"){
        PlotAchievement(oPC, 1);
    }

     // Was checking the wrong module for the baby achievement
 //   if(sModule == "ENDMODULE2"){
 //       PlotAchievement(oPC, 2);
 //       BabyAchievement(oPC, "Chap2");
 //   }

    if(sModule == "x0_module3"){
        PlotAchievement(oPC, 2);
        BabyAchievement(oPC, "Chap2");
    }

    if(sModule == "Chapter3"){
        PlotAchievement(oPC, 3);
    }

    if(sModule == "ENDMODULE3"){
        PlotAchievement(oPC, 4);
    }

    if(sModule == "x0_module3" && CheckMephistoFate() != ""){
        PlotAchievement(oPC, 6);
    }
}

