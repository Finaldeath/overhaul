void main()
{
    if(GetLocalInt(GetLastPerceived(),"NW_L_M1S4Rules") == FALSE &&
       GetIsPC(GetLastPerceived()))
        SpeakOneLinerConversation("M1S4BCoord");
}
