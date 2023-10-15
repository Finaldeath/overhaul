#include "M1_Plot"
void main()
{
    if(GetIsPC(GetClickingObject()))
    {
        if(GetLocalInt(GetModule(),"NW_G_M1Q0End"))
        {
            RestoreEveryone();
            StartNewModule("Chapter1");
        }
        else
        {
            SpeakOneLinerConversation();
        }
    }
}
