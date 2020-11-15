# interoperability-integratedml-adapter
An IRIS Interoperability adapter to use ML models managed by IRIS IntegratedML.

## Contents
* [Project description](#project-description)
* [How to run the example](#how-to-run-the-example)
* [Installation](#installation)
* [Installation (ZPM)](#installation-zpm)
* [How to use the adapter?](#how-to-use-the-adapter)
* [Jupyter notebooks](#jupyter-notebooks)
* [References](#references)

## Project description
The projetc's goal is to let interoperability developers use ML models capabilities in their interoperability productions. Such functionalty is achieve by IRIS Interoperability extension framework, through a custom adapter which access ML models managed by IRIS IntegratedML.

## How to run the example
[Open the production](http://localhost:8092/csp/user/EnsPortal.Productions.zen?$NAMESPACE=USER&$NAMESPACE=USER&) and start it (user/password for IRIS instance: SuperUser/SYS).
As an example of adapter's use, a model for credit card transactions fraud detection was used to simulate a simple financial production. A service starts to receive transactions to process and when a suspicious transaction is detected, an alert is issued.

<p align="center">
  <img src="https://raw.githubusercontent.com/jrpereirajr/interoperability-integratedml-adapter/master/img/KMWbgqw1C9.gif" width="800" title="docker environment topology after installation">
</p>

Results are also persisted in iris-shared/output/valid-transactions.txt file.

<p align="center">
  <img src="https://raw.githubusercontent.com/jrpereirajr/interoperability-integratedml-adapter/master/img/notepad_wPhN8SqVAT.png" width="400" title="docker environment topology after installation">
</p>

## Installation

Clone/git pull the repo into any local directory

```
$ https://github.com/jrpereirajr/interoperability-integratedml-adapter.git
```

Open a Docker terminal in this directory and run:

```
$ docker-compose build
```

3. Run the IRIS container, and Jupyter notebook server images:

```
$ docker-compose up -d
```

## Installation (ZPM)

If you just wanna the adaptor, you could install it through ZPM.
Open Terminal and call:
USER>zpm "install interoperability-integratedml-adapter"

## How to use the adapter?

Create a Business Process or Business Operation which uses as adapter the class dc.ENS.Adapter.ClassificationMLAdapter.
<p align="center">
  <img src="https://raw.githubusercontent.com/jrpereirajr/interoperability-integratedml-adapter/master/img/how-to-use-it-1.png" width="400" title="docker environment topology after installation">
</p>

After saving the class, you must to configure the model's name into parameter "Model", like this:
<p align="center">
  <img src="https://raw.githubusercontent.com/jrpereirajr/interoperability-integratedml-adapter/master/img/how-to-use-it-1.5.png" width="400" title="docker environment topology after installation">
</p>

Now, you can use adapter's method Classify(), and provide a sample of features expected by the model:
<p align="center">
  <img src="https://raw.githubusercontent.com/jrpereirajr/interoperability-integratedml-adapter/master/img/how-to-use-it-2.png" width="400" title="docker environment topology after installation">
</p>

This method returns a object of the class dc.Ens.Adapter.ClassificationResult. As you can see, this class has properties for prediction and probability calculated by the classification model.
<p align="center">
  <img src="https://raw.githubusercontent.com/jrpereirajr/interoperability-integratedml-adapter/master/img/how-to-use-it-3.png" width="400" title="docker environment topology after installation">
</p>

You can use them as your needs. In the example, just the result for fraud prediction was necessary, so the Business Operation class just use value returned into Predicted property:
<p align="center">
  <img src="https://raw.githubusercontent.com/jrpereirajr/interoperability-integratedml-adapter/master/img/how-to-use-it-4.png" width="400" title="docker environment topology after installation">
</p>

## Jupyter notebooks
A notebook explaing the process of analysis and model prototype development is presented at http://localhost:8896/tree.
- [FraudDetection.ipynb](jupyter-samples/FraudDetection.ipynb): A simple model for credit card fraud detection using IntegratedML for auto ML.

## References
This work was based in templates for IRIS Interoperability and IRIS intergrated ML:
- [iris-interoperability-template](https://github.com/intersystems-community/iris-interoperability-template)
- [integratedml-demo-template](https://github.com/intersystems-community/integratedml-demo-template)

Data used for examples, was adapted from public repositories avaible in Kaggle:
- [creditcardfraud](https://www.kaggle.com/mlg-ulb/creditcardfraud)
