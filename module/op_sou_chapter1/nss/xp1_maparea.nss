//Map out the area for PCs
//To go in 'OnEntered' event for the area.

void main()
{

    object oEntered = GetEnteringObject();

    object oArea = GetArea(oEntered);

    if(GetIsPC(oEntered))ExploreAreaForPlayer(oArea, oEntered);


}
