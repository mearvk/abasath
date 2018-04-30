<html>
	
	<jsp:include page="../header.jsp" />

	<jsp:include page="../menu.jsp" />

	<jsp:include page="../subheader.jsp" flush="true"/>

	<div id="//hotels/international" style="position: relative; top: 5px; min-height:1000px; flex:0; border-radius: 5px; overflow:hidden; overflow-y: auto; background-color:#111; font-family:Quicksand; background-repeat: no-repeat;">

		<div style="margin-left:20px; margin-right: 20px; background-color: rgba(30,30,30,1.0); height: 100%; position:relative; top: 40px; height: 800px; padding: 10px;">

	                <div class="pageheader" style="display:block; z-index:1;">

				<p style="display: inline;"><i class="fas fa-angle-double-right"></i>&nbsp;search settings</p>

        	        </div>

                        <div class="page" style="display:block; z-index:1; padding:5px; border-radius: 5px 5px 5px 5px;">

	                        <p style="display: inline;"><i class="fas fa-angle-double-right"></i>&nbsp;options</p>

				<div style="background-color: #555; min-height: 80px;">

					<div style="background-color: #666; margin-top: 10px; min-height:80px;">

						<form style="width:600px; margin: 20px; padding: 20px;">

							<label>&nbsp;&nbsp;<i class="fas fa-angle-double-right"></i>&nbsp;Results Per Page:</label>
							<input type="range" name="resultsperpage" min="10" max="100" list="tickmarks" step="10" style="width:600px; margin: 20px 20px 20px 20px; display:inline; color: #222;">
							<datalist id="tickmarks">
	 					 
	  							<option value="10" label="10">
  								<option value="20" label="20">
	 	 						<option value="30" label="30">
  								<option value="40" label="40">
  								<option value="50" label="50">
  								<option value="60" label="60">
  								<option value="70" label="70">
  								<option value="80" label="80">
  								<option value="90" label="90">
  								<option value="100" label="100">

							</datalist>

                                                      	<label>&nbsp;&nbsp;<i class="fas fa-angle-double-right"></i>&nbsp;Prefer Newer Results:</label>
                                                        <input type="range" name="newer.results.preference" min="10" max="100" list="tickmarks" step="10" style="width:600px; margin: 20px 20px 20px 20px; color: #222;">

                                                        <datalist id="tickmarks">

                                                                <option value="10" label="10">
                                                                <option value="20" label="20">
                                                                <option value="30" label="30">
                                                                <option value="40" label="40">
                                                                <option value="50" label="50">
                                                                <option value="60" label="60">
                                                                <option value="70" label="70">
                                                                <option value="80" label="80">
                                                                <option value="90" label="90">
                                                                <option value="100" label="100">

                                                        </datalist>

                                                        <label>&nbsp;&nbsp;<i class="fas fa-angle-double-right"></i>&nbsp;Prefer Well Known Sites:</label>
                                                        <input type="range" name="well.known.sites.preference" min="10" max="100" list="tickmarks" step="10" style="width:600px; margin: 20px 20px 20px 20px; color:#222;">

                                                        <datalist id="tickmarks">

                                                                <option value="10" label="10">
                                                                <option value="20" label="20">
                                                                <option value="30" label="30">
                                                                <option value="40" label="40">
                                                                <option value="50" label="50">
                                                                <option value="60" label="60">
                                                                <option value="70" label="70">
                                                                <option value="80" label="80">
                                                                <option value="90" label="90">
                                                                <option value="100" label="100">

                                                        </datalist>

							<input type="submit" class="button">

						</form>
						
					</div>

				</div>

                                <div style="background-color: #555;">

                                        <div style="background-color: #666; margin-top: 10px; height:800px;">

                                        </div>

                                </div>
	
                        </div>

		</div>

        </div>

	<jsp:include page="../footer.jsp" />

</html>
