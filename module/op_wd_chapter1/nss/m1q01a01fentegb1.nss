////////// Unlock South Doors so player can go speak to Aribeth
/////////  Set NW_L_M1Q01TALKFENTHICK to 2 to indicate Fenthick has told you to go speak to Aribeth



void main()
{
   SetLocalInt(GetPCSpeaker(),"NW_L_M1Q01TALKFENTHICK",2);
   /////// Unlock south doors
}
