// SPDX-License-Identifier: MIT OR Apache-2.0
//---------------------------------------------------------------------------//
// Copyright (c) 2021 Mikhail Komarov <nemo@nil.foundation>
// Copyright (c) 2021 Ilias Khairullin <ilias@nil.foundation>
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//---------------------------------------------------------------------------//

pragma solidity >=0.6.0;
pragma experimental ABIEncoderV2;

import "truffle/Assert.sol";
import '../contracts/cryptography/polynomial.sol';
import '../contracts/cryptography/field.sol';

contract TestPolynomial {
    function test_polynomial_evaluation_aDeg15_bDeg20() public {
        uint256 modulus = 0x73EDA753299D7D483339D80809A1D80553BDA402FFFE5BFEFFFFFFFF00000001;
        uint256 point = 29181788893541448323641420882899287003407869828616354768876013788195436701687;

        uint256 n = 15;
        uint256 result_a = 6087121465387618081502340300909472999282953585598710376192835153632019218963;
        uint256[] memory coeffs_a = new uint256[](n);
        coeffs_a[0] = uint256(29135246070618182435293609602910730244152485013833232540636066773204938023159);
        coeffs_a[1] = uint256(29820856615386048020899474739106429725468586761566726383110907732707585395070);
        coeffs_a[2] = uint256(6141376241054991133837881641035114479005780891721069008822579092412859507557);
        coeffs_a[3] = uint256(47270625497906931197284315799206789455947671593463023948351667562821603025083);
        coeffs_a[4] = uint256(10633691948873803850726286752665763319581961325899381663045673217431133232403);
        coeffs_a[5] = uint256(35743225196793230753456835611894982415465383573468547134137830527094423969441);
        coeffs_a[6] = uint256(11095899091221158146050644472012634598480924259309916786485464525252977766796);
        coeffs_a[7] = uint256(1244930440393965102009018087688999231120808680813430211825968401808057101372);
        coeffs_a[8] = uint256(19724593166493288680364825904999197504015792427325952346255891976331396356228);
        coeffs_a[9] = uint256(38408411425399439771837106418034053577006029347423723893429173534755556895199);
        coeffs_a[10] = uint256(4658975721346512193393156525603803122039610642117531148526861112467156590357);
        coeffs_a[11] = uint256(46805705709368799026384402881182356552335393525153073779339891998779006078469);
        coeffs_a[12] = uint256(40270035943400403518245235869503406015606750823522126415839328954233300286377);
        coeffs_a[13] = uint256(19242274791613852994062046708895011528612116405970139599063224375941096114882);
        coeffs_a[14] = uint256(51210933877630050308911600222337475468419365406384948922830920749543447648049);
        Assert.equal(result_a, polynomial.evaluate(coeffs_a, point, modulus), "Polynomial a evaluation result is not correct");

        n = 20;
        uint256 result_b = 14517755454571204328742925318278771894557514434895094535074691459831465705004;
        uint256[] memory coeffs_b = new uint256[](n);
        coeffs_b[0] = uint256(9431499787488894661149008816741984285479906304659581068194228584271601821363);
        coeffs_b[1] = uint256(19914219003517389622168654107101311151701175704807593473548482072156090428707);
        coeffs_b[2] = uint256(44931596822430795150017214398013071750380091009533282849366498625029136164396);
        coeffs_b[3] = uint256(24025425256734057189567832606585310567511743595144171994194923116970809772487);
        coeffs_b[4] = uint256(21580461055586947713328941209662714297922130889885371283592837262521819198071);
        coeffs_b[5] = uint256(37850576799824404121391297127212044293049670277401071583728033823195158878689);
        coeffs_b[6] = uint256(3087253529827184297545196053661353398470378941807545958331198657843057961597);
        coeffs_b[7] = uint256(26265505140581246167550926293805491802252716426496777850095465156467683277437);
        coeffs_b[8] = uint256(41952830726100325426499267445447370217400512259695909516569834752872435245759);
        coeffs_b[9] = uint256(19344921746059654747502601345586334685883792321190351694344175229501382633075);
        coeffs_b[10] = uint256(2128622413577031182362945246286329298818092542124176825899180618346520675512);
        coeffs_b[11] = uint256(29680749508369685446631344198736672733948619934942633042963621944920892630113);
        coeffs_b[12] = uint256(27282144339657647103810869451633904237288248759014303365519546329219102502484);
        coeffs_b[13] = uint256(30236225682862859673566240654273543041071742823407177394289544739341927828094);
        coeffs_b[14] = uint256(23706810661846099889322143280186732700514810845757153927793176634091965006451);
        coeffs_b[15] = uint256(23023364941012694988125507559293488787855453380210963964235667344442697080504);
        coeffs_b[16] = uint256(3388153169693156343924982871345687843110174721345985010131272339295368590350);
        coeffs_b[17] = uint256(21629737092293633841808483441609502152835687222025838343942592706898443398521);
        coeffs_b[18] = uint256(35421751487726592093113600554305470436997497989275001484151724878012223715200);
        coeffs_b[19] = uint256(51247318461592091828807885904778616016408560728322067993790715232596969553727);
        Assert.equal(result_b, polynomial.evaluate(coeffs_b, point, modulus), "Polynomial b evaluation result is not correct");
    }

    function test_polynomial_addition_aDeg15_bDeg20() public {
        uint256 modulus = 0x73EDA753299D7D483339D80809A1D80553BDA402FFFE5BFEFFFFFFFF00000001;
        uint256 point = 29181788893541448323641420882899287003407869828616354768876013788195436701687;

        uint256 n = 15;
        uint256[] memory coeffs_a = new uint256[](n);
        coeffs_a[0] = uint256(29135246070618182435293609602910730244152485013833232540636066773204938023159);
        coeffs_a[1] = uint256(29820856615386048020899474739106429725468586761566726383110907732707585395070);
        coeffs_a[2] = uint256(6141376241054991133837881641035114479005780891721069008822579092412859507557);
        coeffs_a[3] = uint256(47270625497906931197284315799206789455947671593463023948351667562821603025083);
        coeffs_a[4] = uint256(10633691948873803850726286752665763319581961325899381663045673217431133232403);
        coeffs_a[5] = uint256(35743225196793230753456835611894982415465383573468547134137830527094423969441);
        coeffs_a[6] = uint256(11095899091221158146050644472012634598480924259309916786485464525252977766796);
        coeffs_a[7] = uint256(1244930440393965102009018087688999231120808680813430211825968401808057101372);
        coeffs_a[8] = uint256(19724593166493288680364825904999197504015792427325952346255891976331396356228);
        coeffs_a[9] = uint256(38408411425399439771837106418034053577006029347423723893429173534755556895199);
        coeffs_a[10] = uint256(4658975721346512193393156525603803122039610642117531148526861112467156590357);
        coeffs_a[11] = uint256(46805705709368799026384402881182356552335393525153073779339891998779006078469);
        coeffs_a[12] = uint256(40270035943400403518245235869503406015606750823522126415839328954233300286377);
        coeffs_a[13] = uint256(19242274791613852994062046708895011528612116405970139599063224375941096114882);
        coeffs_a[14] = uint256(51210933877630050308911600222337475468419365406384948922830920749543447648049);

        n = 20;
        uint256[] memory coeffs_b = new uint256[](n);
        coeffs_b[0] = uint256(9431499787488894661149008816741984285479906304659581068194228584271601821363);
        coeffs_b[1] = uint256(19914219003517389622168654107101311151701175704807593473548482072156090428707);
        coeffs_b[2] = uint256(44931596822430795150017214398013071750380091009533282849366498625029136164396);
        coeffs_b[3] = uint256(24025425256734057189567832606585310567511743595144171994194923116970809772487);
        coeffs_b[4] = uint256(21580461055586947713328941209662714297922130889885371283592837262521819198071);
        coeffs_b[5] = uint256(37850576799824404121391297127212044293049670277401071583728033823195158878689);
        coeffs_b[6] = uint256(3087253529827184297545196053661353398470378941807545958331198657843057961597);
        coeffs_b[7] = uint256(26265505140581246167550926293805491802252716426496777850095465156467683277437);
        coeffs_b[8] = uint256(41952830726100325426499267445447370217400512259695909516569834752872435245759);
        coeffs_b[9] = uint256(19344921746059654747502601345586334685883792321190351694344175229501382633075);
        coeffs_b[10] = uint256(2128622413577031182362945246286329298818092542124176825899180618346520675512);
        coeffs_b[11] = uint256(29680749508369685446631344198736672733948619934942633042963621944920892630113);
        coeffs_b[12] = uint256(27282144339657647103810869451633904237288248759014303365519546329219102502484);
        coeffs_b[13] = uint256(30236225682862859673566240654273543041071742823407177394289544739341927828094);
        coeffs_b[14] = uint256(23706810661846099889322143280186732700514810845757153927793176634091965006451);
        coeffs_b[15] = uint256(23023364941012694988125507559293488787855453380210963964235667344442697080504);
        coeffs_b[16] = uint256(3388153169693156343924982871345687843110174721345985010131272339295368590350);
        coeffs_b[17] = uint256(21629737092293633841808483441609502152835687222025838343942592706898443398521);
        coeffs_b[18] = uint256(35421751487726592093113600554305470436997497989275001484151724878012223715200);
        coeffs_b[19] = uint256(51247318461592091828807885904778616016408560728322067993790715232596969553727);

        n = 20;
        uint256[] memory coeffs_sum = new uint256[](n);
        coeffs_sum[0] = uint256(38566745858107077096442618419652714529632391318492813608830295357476539844522);
        coeffs_sum[1] = uint256(49735075618903437643068128846207740877169762466374319856659389804863675823777);
        coeffs_sum[2] = uint256(51072973063485786283855096039048186229385871901254351858189077717441995671953);
        coeffs_sum[3] = uint256(18860175579514797907404407897606134185768862688079558119942931979853831613057);
        coeffs_sum[4] = uint256(32214153004460751564055227962328477617504092215784752946638510479952952430474);
        coeffs_sum[5] = uint256(21157926821491444395400392230921060870824501350341980895262205650351001663617);
        coeffs_sum[6] = uint256(14183152621048342443595840525673987996951303201117462744816663183096035728393);
        coeffs_sum[7] = uint256(27510435580975211269559944381494491033373525107310208061921433558275740378809);
        coeffs_sum[8] = uint256(9241548717467423627416352842260601883725752186494224040222068029265250417474);
        coeffs_sum[9] = uint256(5317457996332904039891967255434422425199269168086437765169690064318358343761);
        coeffs_sum[10] = uint256(6787598134923543375756101771890132420857703184241707974426041730813677265869);
        coeffs_sum[11] = uint256(24050580042612293993568006571733063448593460959568068999699855243761317524069);
        coeffs_sum[12] = uint256(15116305107931860142608364812951344415204447082008791958755216583513821604348);
        coeffs_sum[13] = uint256(49478500474476712667628287363168554569683859229377316993352769115283023942976);
        coeffs_sum[14] = uint256(22481869364349959718786002994338242331243623751614465028020438683696831469987);
        coeffs_sum[15] = uint256(23023364941012694988125507559293488787855453380210963964235667344442697080504);
        coeffs_sum[16] = uint256(3388153169693156343924982871345687843110174721345985010131272339295368590350);
        coeffs_sum[17] = uint256(21629737092293633841808483441609502152835687222025838343942592706898443398521);
        coeffs_sum[18] = uint256(35421751487726592093113600554305470436997497989275001484151724878012223715200);
        coeffs_sum[19] = uint256(51247318461592091828807885904778616016408560728322067993790715232596969553727);
        uint256[] memory a_plus_b = polynomial.add_poly(coeffs_a, coeffs_b, modulus);
        Assert.equal(coeffs_sum, a_plus_b, "Polynomial addition result is not correct");
    }

    function test_polynomial_multiplication_aDeg15_bDeg20() public {
        uint256 modulus = 0x73EDA753299D7D483339D80809A1D80553BDA402FFFE5BFEFFFFFFFF00000001;
        uint256 point = 29181788893541448323641420882899287003407869828616354768876013788195436701687;

        uint256 n = 15;
        uint256[] memory coeffs_a = new uint256[](n);
        coeffs_a[0] = uint256(29135246070618182435293609602910730244152485013833232540636066773204938023159);
        coeffs_a[1] = uint256(29820856615386048020899474739106429725468586761566726383110907732707585395070);
        coeffs_a[2] = uint256(6141376241054991133837881641035114479005780891721069008822579092412859507557);
        coeffs_a[3] = uint256(47270625497906931197284315799206789455947671593463023948351667562821603025083);
        coeffs_a[4] = uint256(10633691948873803850726286752665763319581961325899381663045673217431133232403);
        coeffs_a[5] = uint256(35743225196793230753456835611894982415465383573468547134137830527094423969441);
        coeffs_a[6] = uint256(11095899091221158146050644472012634598480924259309916786485464525252977766796);
        coeffs_a[7] = uint256(1244930440393965102009018087688999231120808680813430211825968401808057101372);
        coeffs_a[8] = uint256(19724593166493288680364825904999197504015792427325952346255891976331396356228);
        coeffs_a[9] = uint256(38408411425399439771837106418034053577006029347423723893429173534755556895199);
        coeffs_a[10] = uint256(4658975721346512193393156525603803122039610642117531148526861112467156590357);
        coeffs_a[11] = uint256(46805705709368799026384402881182356552335393525153073779339891998779006078469);
        coeffs_a[12] = uint256(40270035943400403518245235869503406015606750823522126415839328954233300286377);
        coeffs_a[13] = uint256(19242274791613852994062046708895011528612116405970139599063224375941096114882);
        coeffs_a[14] = uint256(51210933877630050308911600222337475468419365406384948922830920749543447648049);

        n = 20;
        uint256[] memory coeffs_b = new uint256[](n);
        coeffs_b[0] = uint256(9431499787488894661149008816741984285479906304659581068194228584271601821363);
        coeffs_b[1] = uint256(19914219003517389622168654107101311151701175704807593473548482072156090428707);
        coeffs_b[2] = uint256(44931596822430795150017214398013071750380091009533282849366498625029136164396);
        coeffs_b[3] = uint256(24025425256734057189567832606585310567511743595144171994194923116970809772487);
        coeffs_b[4] = uint256(21580461055586947713328941209662714297922130889885371283592837262521819198071);
        coeffs_b[5] = uint256(37850576799824404121391297127212044293049670277401071583728033823195158878689);
        coeffs_b[6] = uint256(3087253529827184297545196053661353398470378941807545958331198657843057961597);
        coeffs_b[7] = uint256(26265505140581246167550926293805491802252716426496777850095465156467683277437);
        coeffs_b[8] = uint256(41952830726100325426499267445447370217400512259695909516569834752872435245759);
        coeffs_b[9] = uint256(19344921746059654747502601345586334685883792321190351694344175229501382633075);
        coeffs_b[10] = uint256(2128622413577031182362945246286329298818092542124176825899180618346520675512);
        coeffs_b[11] = uint256(29680749508369685446631344198736672733948619934942633042963621944920892630113);
        coeffs_b[12] = uint256(27282144339657647103810869451633904237288248759014303365519546329219102502484);
        coeffs_b[13] = uint256(30236225682862859673566240654273543041071742823407177394289544739341927828094);
        coeffs_b[14] = uint256(23706810661846099889322143280186732700514810845757153927793176634091965006451);
        coeffs_b[15] = uint256(23023364941012694988125507559293488787855453380210963964235667344442697080504);
        coeffs_b[16] = uint256(3388153169693156343924982871345687843110174721345985010131272339295368590350);
        coeffs_b[17] = uint256(21629737092293633841808483441609502152835687222025838343942592706898443398521);
        coeffs_b[18] = uint256(35421751487726592093113600554305470436997497989275001484151724878012223715200);
        coeffs_b[19] = uint256(51247318461592091828807885904778616016408560728322067993790715232596969553727);

        n = 34;
        uint256[] memory coeffs_mul = new uint256[](n);
        coeffs_mul[0] = uint256(37533930090538066267753935842943846050427386076332358641707475707016789837623);
        coeffs_mul[1] = uint256(47997474827940974867595560069133204316635668853975783411868144934517799630257);
        coeffs_mul[2] = uint256(1917812253734727619624457293292225427086457420706032852831029532563865282263);
        coeffs_mul[3] = uint256(26212801959926421615988853715178360840421405071839972090171187146524981004330);
        coeffs_mul[4] = uint256(42567611215859419088272916052096938096536655060677217612978131471970454605676);
        coeffs_mul[5] = uint256(46394993799345328054508154151695858994208216167095094174902253867775481522437);
        coeffs_mul[6] = uint256(20519352080707837214954538284629627728984021605224427883938387166364805957269);
        coeffs_mul[7] = uint256(19189103058201272993245747556450737602323173312259009573231273411011357800099);
        coeffs_mul[8] = uint256(16878523013931917228427597782295814041409508480108497773995133557810034283738);
        coeffs_mul[9] = uint256(1709361816004059697211981489021624911579363367733572865941328728404595335901);
        coeffs_mul[10] = uint256(11828988500277342831184475690700416275492331300736257452219735846810944351189);
        coeffs_mul[11] = uint256(16842991238789447636848428573227641209397136677079202513989821586777933501844);
        coeffs_mul[12] = uint256(5597663563425847486922121582251579509247251544553749901136631061772928582808);
        coeffs_mul[13] = uint256(482135445228095810093160974966147287054002765563993310093490692139438380230);
        coeffs_mul[14] = uint256(13905824432491707648259679671870141581288318774565346608000283436127372773167);
        coeffs_mul[15] = uint256(16375134676320305895561598576026728223379608577349881165131707309883844057320);
        coeffs_mul[16] = uint256(16010522691100177409851687539918517262369933471234404997621537211286799494223);
        coeffs_mul[17] = uint256(18768534206594136969805132767670747980850012772916557830976849704735293914090);
        coeffs_mul[18] = uint256(36493313728249215648829445358814173989646918222346082496428578811018101060311);
        coeffs_mul[19] = uint256(18221277377759474499596609674250961080328390419413932671923627922240111296267);
        coeffs_mul[20] = uint256(46409467389750574827901667236327314065850684926758924235610513115492493559646);
        coeffs_mul[21] = uint256(3510727876983825753667642268958058096744972320304970847457145695168428857381);
        coeffs_mul[22] = uint256(36790342906406467650548089102243728453033073540782039995393979051286531653213);
        coeffs_mul[23] = uint256(46999714242460141343130759379348944184527291182925550306059171664885708187069);
        coeffs_mul[24] = uint256(29738427097740912988167149602928055573571475515804158893694081288134282772188);
        coeffs_mul[25] = uint256(50965507495409388631385471767707484119447176729209188317844871017127104171944);
        coeffs_mul[26] = uint256(19596119894133871222204617379077248827374731478563854737729705102559605309677);
        coeffs_mul[27] = uint256(3403547379095613756589275649840742000643503883812744945548631032348072128174);
        coeffs_mul[28] = uint256(34098577277941187270553358393270004633417305840052944729958733866934440431173);
        coeffs_mul[29] = uint256(11768402651734326676950704977229314197630411314233784115317419118135498714266);
        coeffs_mul[30] = uint256(8587506466225587701380478205188659349186716946495888874999468084821337869797);
        coeffs_mul[31] = uint256(23095283302844004528854017195459146622662540890046538607288251350326507217544);
        coeffs_mul[32] = uint256(45815246088579244773243928572080583080745677230128753810473105432520879086931);
        coeffs_mul[33] = uint256(18846607898602946561630534830837489232188727774005472911573896473436323752210);
        uint256[] memory a_mul_b = polynomial.mul_poly(coeffs_a, coeffs_b, modulus);
        Assert.equal(coeffs_mul.length, a_mul_b.length, "Polynomial multiplication result length is not correct");
        Assert.equal(coeffs_mul, a_mul_b, "Polynomial multiplication result is not correct");
    }

    function test_lagrange_interpolation() public {
        uint256 modulus = 0x73EDA753299D7D483339D80809A1D80553BDA402FFFE5BFEFFFFFFFF00000001;
        uint256 n = 3;
        uint256[] memory xs = new uint256[](n);
        xs[0] = uint256(4183765791887380684480255226180760560865026071039013052010193328713615339463);
        xs[1] = uint256(41539907117522402745491644732028924977664979905128012893033887353901692293856);
        xs[2] = uint256(40744787028008542045211760826403355424425002249388314752473792073759989008118);
        uint256[] memory fxs = new uint256[](n);
        fxs[0] = uint256(31102318824077738286102042205447650848522120060321475185704476031394567067018);
        fxs[1] = uint256(28448837760680269221266237156411444765443870003701617079904611621539413948874);
        fxs[2] = uint256(21652586267347562689641261610058946541341503152256840037277559314528271150653);
        uint256[] memory etalon_interpolated_poly = new uint256[](n);
        etalon_interpolated_poly[0] = uint256(45863909754770953574941211132560772200443894513098009385289015884407326107132);
        etalon_interpolated_poly[1] = uint256(306400884220968022577340188138333996135439223138113708607130720467290203462);
        etalon_interpolated_poly[2] = uint256(40785886772544473963190998835184144050681147583222663910965803442251397137695);
        uint256[] memory interpolated_poly = polynomial.lagrange_interpolation(xs, fxs, modulus);
        Assert.equal(etalon_interpolated_poly.length, interpolated_poly.length, "Lagrange interpolation result length is not correct");
//        for (uint256 i = 0; i < interpolated_poly.length; i++) {
//            Assert.equal(etalon_interpolated_poly[i], interpolated_poly[i], "Lagrange interpolation result is not correct");
//        }
        Assert.equal(etalon_interpolated_poly, interpolated_poly, "Lagrange interpolation result is not correct");
    }

    function test_lagrange_interpolation_by_2_points_neg_x() public {
        uint256 modulus = 0x73EDA753299D7D483339D80809A1D80553BDA402FFFE5BFEFFFFFFFF00000001;
        uint256 x = 44038862670345190294673664060592308181004034858773208775317302252436776935563;
        uint256 dblXInv = field.inverse_static((2 * x) % modulus, modulus);
        uint256 fx = 49493457902001516273705036835225226573976620701363464555283163139256350994103;
        uint256 f_minus_x = 28976720826705814608978164416095000797859924214963526570316110117483425299187;
        uint256 xInv = 47098724223474821775521332453585531707749745902334713572669745831884543336149;
        uint256 point = 48153868050457893764636815688936466338946039141187270065866853882046790835184;
        uint256 interpolate_p = 47167026852270603624692004883323338002565421423261929593965935305477245075449;
        uint256 interpolate_p2 = 41898178529415016769936269258460710167440290345996221365328211911015908966385;
        uint256 ans = polynomial.interpolate_evaluate_by_2_points_neg_x(x, dblXInv, fx, f_minus_x, point, modulus);
        Assert.equal(interpolate_p, ans, "Lagrange interpolation evaluation result is not correct");
    }

    function test_lagrange_interpolation_by_2_points1() public {
        uint256 modulus = 0x73EDA753299D7D483339D80809A1D80553BDA402FFFE5BFEFFFFFFFF00000001;
        uint256[] memory x = new uint256[](2);
        x[0] = 44038862670345190294673664060592308181004034858773208775317302252436776935563;
        x[1] = modulus - 44038862670345190294673664060592308181004034858773208775317302252436776935563;
        uint256[] memory fx = new uint256[](2);
        fx[0] = 49493457902001516273705036835225226573976620701363464555283163139256350994103;
        fx[1] = 28976720826705814608978164416095000797859924214963526570316110117483425299187;
        uint256 point = 48153868050457893764636815688936466338946039141187270065866853882046790835184;
        uint256 interpolate_p = 47167026852270603624692004883323338002565421423261929593965935305477245075449;
        uint256 ans = polynomial.interpolate_evaluate_by_2_points(x, fx, point, modulus);
        Assert.equal(interpolate_p, ans, "Lagrange interpolation evaluation result is not correct");
    }

    function test_lagrange_interpolation_by_2_points2() public {
        uint256 modulus = 0x73EDA753299D7D483339D80809A1D80553BDA402FFFE5BFEFFFFFFFF00000001;
        uint256[] memory x = new uint256[](2);
        x[0] = 41647106870606161616591387966715847902573139189804717221698810708101242940521;
        x[1] = 7618811309034160695676016680056885734768587155692572468640041509483598127985;
        uint256[] memory fx = new uint256[](2);
        fx[0] = 10830495527854936642823522147966338959848560248013811437627905910805426798945;
        fx[1] = 42429922444448686604017683269922063440964335484964201106691762991369582981200;
        uint256 point = 24868796103580083179645354023730047815734900319155333463213446778245767615297;
        uint256 interpolate_p = 40762883383788727750124127024453804465754478296506721859951139537974273249132;
        uint256 ans = polynomial.interpolate_evaluate_by_2_points(x, fx, point, modulus);
        Assert.equal(interpolate_p, ans, "Lagrange interpolation evaluation result is not correct");
    }

    function test_lagrange_interpolate_then_evaluate_by_2_points() public {
        uint256 modulus = 0x73EDA753299D7D483339D80809A1D80553BDA402FFFE5BFEFFFFFFFF00000001;
        uint256[] memory x = new uint256[](2);
        x[0] = 41647106870606161616591387966715847902573139189804717221698810708101242940521;
        x[1] = 7618811309034160695676016680056885734768587155692572468640041509483598127985;
        uint256[] memory fx = new uint256[](2);
        fx[0] = 10830495527854936642823522147966338959848560248013811437627905910805426798945;
        fx[1] = 42429922444448686604017683269922063440964335484964201106691762991369582981200;
        uint256 point = 24868796103580083179645354023730047815734900319155333463213446778245767615297;
        uint256 interpolate_p = 40762883383788727750124127024453804465754478296506721859951139537974273249132;
        uint256[] memory coeffs = polynomial.interpolate(x, fx, modulus);
        Assert.equal(interpolate_p, polynomial.evaluate(coeffs, point, modulus), "Evaluation of interpolated polynomial is not correct");
    }
}
