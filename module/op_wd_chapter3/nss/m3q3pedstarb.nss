//* Check if other pedestals used, then unlock
void main()
{
int nEvent = GetUserDefinedEventNumber();

switch(nEvent)
    {
    case 300:
//    SpeakString("user defined");
        {
        if( (GetLocalInt(GetObjectByTag("M3Q3PedPurple"),"M3Q3PurpleLight") == 1) &&
        (GetLocalInt(GetObjectByTag("M3Q3PedWhite"),"M3Q3WhiteLight") == 1) &&
        (GetLocalInt(GetObjectByTag("M3Q3PedBlue"),"M3Q3BlueLight") == 1) &&
        (GetLocalInt(GetObjectByTag("M3Q3PedGreen"),"M3Q3GreenLight") == 1) &&
         GetLocked(OBJECT_SELF) == TRUE)
               {
                //SpeakString("unlocking");
                SetLocked(OBJECT_SELF,FALSE);
                  location lStar = GetLocation(OBJECT_SELF);
                 CreateObject(OBJECT_TYPE_PLACEABLE,"M3Q3D_SPARKGREEN",lStar);
                 CreateObject(OBJECT_TYPE_PLACEABLE,"M3Q3D_SPARKWHITE",lStar);
                 CreateObject(OBJECT_TYPE_PLACEABLE,"M3Q3D_SPARKBLUE",lStar);
                 CreateObject(OBJECT_TYPE_PLACEABLE,"M3Q3D_SPARKPURP",lStar);

               }
        }
    break;
    }
}
