#include "nw_i0_plot"
#include "M3PLOTINCLUDE"

int StartingConditional()
{
int l_iResult;

/*l_iResult = CheckIntelligenceLow() &&
            GetLocalInt(OBJECT_SELF, "NW_L_TALKLEVEL") == 2
            && HasHeadOfCommand(GetPCSpeaker());*/
    if(CheckIntelligenceLow())
    {
//        SpeakString("Me dumb");
        if(GetLocalInt(GetPCSpeaker(),"Zokan") ==1)
        {
//            SpeakString("Talked about Zokan");
            if(HasHeadOfCommand(GetPCSpeaker()) && GetLocalInt(OBJECT_SELF,"NW_G_M3Q2A_ZOKANHEAD")==0)
            {
//                SpeakString("Has head");
                l_iResult = TRUE;
            }
        }
   }

///////  ALSO CHECK THAT PLAYER HAS Zokan's HEAD (MPlAeZokan'sh3Q2)

return l_iResult;


}

